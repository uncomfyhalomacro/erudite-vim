local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	[[                                         .+"                          ]],
	[[                                         +#*                         	]],
	[[                        _-            .``.}' ..                       ]],
	[[                       `#*.           ;'.<i >#t                       ]],
	[[                       .|^ ..         `. '<'_;.                       ]],
	[[                   '. .i\,,`';       .vc'"j"^^`^`   )z!               ]],
	[[          `". .u).`#~   ]_ "`^      `` "~vt^    .:  <##'              ]],
	[[          :#t  ."i;"  ''.!    `^^,  zf ^#+`I^  ,^' ``.?.`"`           ]],
	[[           '|.    >^ i'."j.`#"!^`.+ i..nt^``  ?\  }#? >(.':,          ]],
	[[            ._`;`".<''". .}'>`    x., }f.   '. ,.';`  {. '`           ]],
	[[       ':`""  :['`. |<i    <,I   ,#[ .#,. ``.';^('   :"               ]],
	[[    .. +.,``  . ^,` .|(.^l>ir#> `z\  ,#__ ,.'' #l   ~/`")ni`. .".     ]],
	[[    ?#(',   )*#]``"::;t#]`''"|#tzv.  ;##. .l' `#,'iv|".   ^`<'f#"     ]],
	[[     .'^")!`.'.       'I(!'   t##I   :#z  .j:.r####:.     .;/:;^      ]],
	[[        .,_}_l::l~}({_I"'`?/:.'##`   ^##,  .\v##t>lIl!;,:;:^. f\      ]],
	[[       ~[`. `z_     ':)*##tj#*1*#`   '##z''/####*),.   -t.""..-.      ]],
	[[     .)'l`+  .```,:;!!;If########:   .###c*f,'..`lr#1^^-. ^`\f,^"",.  ]],
	[[     ,#: ':!"'`"~-:,)?II_t#######x    ####+   ]' .'<#j>;"^"".   ~``,  ]],
	[[      ^.   ''.>i.  '   `I;";n#####<  .###f.`!rvfc#z#t".   .,^`  .`'   ]],
	[[      .     `_.     `^. ``.',x#####< `###*####r1,   .^+j];"^^:  :}"   ]],
	[[     iz#1^^,|   .` <.,]       l#####/1#####f,..'.- .  '"{#],^^^+{?'   ]],
	[[       .    ~'``^t1;,  .',>_~iIx#########u"   .",'},[`#t >tl. ^^" `   ]],
	[[  'i:. ,^^, '``.   `_#*z};"";1##########*",i__~I"'^>j:^'^ I ""^^;n#'  ]],
	[[   -*n.)."`      `>[jv:.   `]''u#########*};"",<j##u/,..`"'     </>   ]],
	[[     .`,]<;"",i~~".!/.     .;}':########1.       `}?.'^:,"`''`,,.     ]],
	[[           ...    +-      `,,:}(#######n           'i^ >Il`...        ]],
	[[            ',^ .],      <^  .:z#######>             ':l:;'           ]],
	[[            ,^`:!.       >'.1  :#######:                              ]],
	[[             .'           '`   '#######;                              ]],
	[[                               .#######<                              ]],
	[[                               '#######t                              ]],
	[[                               :########'                             ]],
	[[                               j########f.                            ]],
	[[                              :##########t.                           ]],
	[[                              ````````````.                           ]],
}
--Set menu
dashboard.section.buttons.val = {
	dashboard.button("SPC f e", "   →   Open file explorer", ":NvimTreeToggle <CR>"),
	dashboard.button("SPC f n", "   →   New file", ":enew <BAR> startinsert <CR>"),
	dashboard.button("SPC f f", "   →   Search files", ":cd $PWD | Telescope find_files <CR>"),
	dashboard.button("SPC f h", "   →   Recently opened files", ":Telescope oldfiles <CR>"),
	dashboard.button("SPC f b", "   →   Marks", ":Telescope marks <CR>"),
	dashboard.button("q", "   →   Quit", ":qa <CR>"),
}

--Set footer
math.randomseed(os.time())

local footers = {
	"You who have profound knowledge are here to learn and prosper!",
	"Those who know nothing is but a process for those who are curious of the unknown",
	"The present is but a mere reflection of the past and the future",
}

local randomize = math.random(#footers)
dashboard.section.footer.val = footers[randomize]

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
