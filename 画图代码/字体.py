import matplotlib.font_manager as fm

# 列出系统中可用的所有字体
for font in fm.findSystemFonts(fontpaths=None, fontext='ttf'):
    print(fm.FontProperties(fname=font).get_name())
