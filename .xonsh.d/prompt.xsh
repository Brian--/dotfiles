import xonsh.tools as xt

$PROMPT_FIELDS['prompt_end'] = lambda: '#' if xt.is_superuser() else 'λ'
$PROMPT_FIELDS['env_prefix'] = ''
$PROMPT_FIELDS['env_postfix'] = ''

$XONSH_GITSTATUS_UNTRACKED='?'
$XONSH_GITSTATUS_STASHED='$'
$XONSH_GITSTATUS_BRANCH='on {BOLD_PURPLE} '

def _PROMPT():
    print('\a', end='')
    return '''
{BOLD_BLUE}{cwd}{gitstatus: {}}{NO_COLOR}{env_name: via {}}
{ret_code_color}{prompt_end}{NO_COLOR} '''

$PROMPT = _PROMPT

$RIGHT_PROMPT = '{ret_code_color}{ret_code}{NO_COLOR}'
