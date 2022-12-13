import re
# from talon import actions, Module

FILE_NAME = 'tags\\browser\\chrome_my'

def convert():
    with open(FILE_NAME + ".py", 'r') as f:
        content = f.read()

        # remove execute first
        content = re.sub(r'.execute\(\)', r'', content, flags=re.M)
        
        # inside key functions
        keys = re.findall(r'Key\((.*)\)', content, flags=re.M)
        for key in keys:
            key_new = re.sub(', ', r' ', key, flags=re.M)
            key_new = re.sub('cs-', r'ctrl-shift-', key_new, flags=re.M)
            key_new = re.sub('a-', r'alt-', key_new, flags=re.M)
            key_new = re.sub('c-', r'ctrl-', key_new, flags=re.M)
            key_new = re.sub('s-', r'shift-', key_new, flags=re.M)
            key_new = re.sub('w-', r'super-', key_new, flags=re.M)
            key_new = re.sub(r'/(\d+) ', r'")\n    actions.sleep("\1ms")\n    actions.key("', key_new, flags=re.M)
            # key_new = re.sub('/(\d+)"', r'")\nactions.sleep("\1ms")', key_new, flags=re.M)
            content = content.replace(key, key_new)
            print(key + '\n' + key_new + '\n')
        
        # commands for the .talon file and implementations for the .py file
        content_new = content
        content_new = re.sub(r'Key\((.*)\)', r'actions.key(\1)', content_new, flags=re.M)
        content_new = re.sub(r'Text\((.*)\)', r'actions.insert(\1)', content_new, flags=re.M)
        content_new = re.sub(r'Pause\("(.*)"\)', r'actions.sleep("\1ms")', content_new, flags=re.M)
        content_new = re.sub(r'FocusWindow\(title="(.*)"\)', r'actions.user.switcher_focus("\1")', content_new, flags=re.M)

        # remove imports
        content_new = re.sub(r'.?from dragonfly.*', r'', content_new, flags=re.M)
        content_new = re.sub(r'.?from castervoice.*', r'', content_new, flags=re.M)

        # separate out everything before commands for the .py file
        py_content = re.split(r'.*\(MappingRule.\)*', content_new, flags=re.M)[0]
        # print(py_content)
        py_content = py_content.strip()

        py_content = add_modules(py_content)
        
        # separate out commands for the .talon file
        m = re.search(r'mapping = {((?s).*?)}', content_new, flags=re.M)
        talon_content = m.group(1)
        # print("matched talon_content")
        # print(talon_content)

        # commands for the .talon file
        talon_content = re.sub(r'"(.*)":', r'\1:', talon_content, flags=re.M)
        talon_content = re.sub(r'R\((.*)\),', r'\1', talon_content, flags=re.M)
        talon_content = re.sub(r'Function\((.*)\)', r'user.\1()', talon_content, flags=re.M)

        talon_content = re.sub(r'        ', '', talon_content, flags=re.M)
        talon_content = talon_content.strip()

        # print(py_content)
        with open(FILE_NAME + "_talon.py", 'w') as fout:
            fout.write(py_content)

        with open(FILE_NAME + "_talon.talon", 'w') as fout:
            fout.write(talon_content)

def add_modules(py_content):
    module_template = """

mod = Module()

@mod.action_class
class MySeleniumBrowserActions:"""

    action_template = """
    def fun():
        ""
        fun()"""

    py_content += module_template

    for fun in re.finditer(r'(def)\s(\w+)\([a-zA-Z0-9_:\[\]=, ]*\)', py_content, flags=re.M):
        string = fun.group(2)
        print(string)
        py_content += action_template.replace('fun', string)
       
    py_content = "from talon import actions, Module\n\n" + py_content
    return py_content


# convert()

# mod = Module()

# @mod.action_class
# class MySeleniumBrowserActions:
#     def convert_caster_to_talon():
#         ""
#         convert()
