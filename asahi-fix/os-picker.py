import termios, sys, os

BLACK = 30
RED = 31
GREEN = 32
YELLOW = 33
BLUE = 34
MAGENTA = 35
CYAN = 36
WHITE = 37

BRIGHT = 1
DIM = 2
NORMAL = 22
RESET_ALL = 0


def col(*color):
    color = ";".join(map(str, color))
    return f"\033[{color}m"

def p_style(*args, color=[], **kwargs):
    if isinstance(color, int):
        color = [color]
    text = " ".join(map(str, args))
    print(col(*color) + text + col(), **kwargs)
    if "\033" in text:
        text += col()

def p_choice(*args):
    p_style(*args)

def p_warning(*args):
    p_style(*args, color=(BRIGHT, YELLOW))

def p_error(*args):
    p_style(*args, color=(BRIGHT, RED))

def p_question(*args):
    p_style(*args, color=(BRIGHT, CYAN))

def input_prompt(*args):
    while True:
        p_style(f"{col(BRIGHT, WHITE)}»{col(BRIGHT, CYAN)}", *args, end="")
        val = input()
        if any (ord(c) < 0x20 for c in val):
            p_error("Invalid input")
            continue
        break
    return val

def flush_input():
    try:
        termios.tcflush(sys.stdin, termios.TCIFLUSH)
    except:
        pass

def choice(prompt, options, default=None):
    is_array = False

    if isinstance(options, list):
        is_array = True
        options = {str(i + 1): v for i, v in enumerate(options)}
        if default is not None:
            default += 1

    int_keys = all(isinstance(i, int) for i in options.keys())

    for k, v in options.items():
        p_choice(f"  {col(BRIGHT)}{k}{col(NORMAL)}: {v}")

    if default:
        prompt += f" ({default})"

    while True:
        flush_input()
        res = input_prompt(prompt + ": ").strip()
        if res == "" and default is not None:
            res = str(default)
        if res not in options:
            p_warning(f"Enter one of the following: {', '.join(map(str, options.keys()))}")
            continue
        print()
        if is_array:
            return int(res) - 1
        else:
            return res

if __name__ == "__main__":
    print()
    oslist = [
        "Arch Linux (Official)",
        "Debian"
    ]
    p_question("Choose an OS to install:")
    try:
        osPick = int(choice("OS name", oslist))
        try:
            with open('os.txt', 'w', encoding='utf-8') as f:
                f.write(str(osPick))
        except:
            p_error("Please choose the right number!")
            exit(1)
    except:
        p_error("Please choose the right number!")
        exit(1)
    os.system(os.path.abspath('./asahi-fix/fix-runner.py'))
