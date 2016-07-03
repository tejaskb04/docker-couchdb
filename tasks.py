import invoke
import jinja2
import sys
import yaml


@invoke.task()
def compile_config():
    # Parse our compile config
    with open('_compile-config.yml') as f:
        compile_config_yaml = yaml.safe_load(f)

    # Compile each jinja2 file
    for jinja2_entry in compile_config_yaml['jinja2']['entries']:
        jinja2_environment = jinja2.Environment(loader=jinja2.FileSystemLoader(searchpath='.'))
        template = jinja2_environment.get_template(jinja2_entry['in'])
        with open(jinja2_entry['out'], 'w') as f:
            f.write(template.render(compile_config_yaml['config']))


@invoke.task
def update_base():
    invoke.run('git pull https://github.com/fogies/docker-base.git master', encoding=sys.stdout.encoding)
