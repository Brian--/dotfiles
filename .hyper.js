// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

// so prettier formats my inline css
const css = (s) => s

module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 10,

    // font family with optional fallbacks
    fontFamily: '"OperatorMono Nerd Font"',

    // default font weight: 'normal' or 'bold'
    fontWeight: 'normal',

    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: 'bold',

    // line height as a relative unit
    lineHeight: 1,

    // letter spacing as a relative unit
    letterSpacing: 0,

    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BLOCK',

    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: true,

    // custom CSS to embed in the main window
    css: css`
      .header_header {
        top: unset;
        bottom: 1px;
      }
      .terms_termsShifted {
        margin-top: unset !important;
        margin-bottom: 34px;
      }
    `,

    // custom CSS to embed in the terminal window
    termCSS: '',

    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: false,

    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: '0px 0px 0px 6px',

    shell: '/home/brian/.local/bin/xonsh',

    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,

    // Whether to use the WebGL renderer. Set it to false to use canvas-based
    // rendering (slower, but supports transparent backgrounds)
    webGLRenderer: true,

    // plugins
    hyper_solarized: {
      auto: true,
      borderColor: '#3c4a4e',
    },

    hyperdrop: {
      shortcut: 'F12',
      width: 0.7,
      height: 400,
    },
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  plugins: [
    'hyper-solarized',
    'hyper-native-window-decoration',
    'hyper-single-instance',
    'hypercwd',
  ],

  localPlugins: ['hyperdrop'],

  keymaps: {},
}
