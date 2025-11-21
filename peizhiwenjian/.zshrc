# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias cc='cd ~ && cd my_code && cd c-code && c'
alias py='cd ~ && cd my_code && cd python-code && cd one-python-a-good'
alias web='cd ~ && cd my_code/web开发'
alias ck='cd ~ && cd my_code/c-code/c/课堂学习'
alias csh='cd ~ && cd my_code/shell_code'
alias html="cd ~ && cd my_code/web开发/my_html && vim a.html"
#一个一键改名函数
h_a_name(){
mv a.html $1.html
}

# Git Add, Commit, Push 一键函数
gitacpp() {
    if [ $# -eq 0 ]; then
        echo "错误：请提供提交信息"
        echo "用法: gitacp \"你的提交信息\""
        return 1
    fi

    echo "🏃 执行 git add ."
    git add .

    echo "💾 执行 git commit -m \"$*\""
    git commit -m "$*"

   echo "执行 git pull "
   git pull

    echo "🚀 执行 git push"
    git push

    echo "✅ 完成！代码已提交并推送到远程仓库"
}


export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export PATH=$JAVA_HOME/bin:$PATH
gcccc(){
gcc $1.c -o $1 -ml && ./$1
}
ysh(){ chmod a+x $1.sh  && ./$1.sh}
#!/bin/zsh

# 欢迎信息 - 只在登录时显示一次
if [ -z "$WELCOME_SHOWN" ]; then
#-z用来判断字符串是否为空,WELCOM_SHOWN是一个环境变量.
#也就是说,如果这个环境变量为空,也就是第一次登录,那么就会执行后面的代码.
    # 获取系统信息
    memory_usage=$(free -h | awk 'NR==2{print $3"/"$2}')  #内存
    disk_usage=$(df -h / | awk 'NR==2{print $5 " used (" $4 " free)"}') #硬盘
    uptime_formatted=$(uptime -p | sed 's/up //')  #系统运行时间
    #定义了三个变量,用来储存命令执行的结果.
    #这是很有计术含量的一段,awk,sed,grep文本处理三剑客,|管道符,左边的输出作为右边的输入.
    #$(命令or变量名),现代的获取内容的方式.
    #
    #
    
    # 扩展的名言数组（100+ 条程序员相关名言）
    quotes=(
        # 编程哲学类
        "代码是写给人看的，顺便让机器执行"
        "编程不是打字，是解决问题的艺术"
        "简单是可靠的先决条件"
        "最有效的调试工具是仔细思考"
        "优秀的程序员写出人类能理解的代码"
        "编程是理解和抽象的艺术"
        "代码质量与注释数量成反比"
        "设计模式是解决特定问题的经验总结"
        "重构是永无止境的过程"
        "测试只能证明bug存在，不能证明bug不存在"
        
        # 技术实践类
        "不要重复造轮子，但要懂得轮子的原理"
        "过早优化是万恶之源"
        "代码review是最好的学习方式"
        "git commit -m 'fix bug' 是最危险的提交"
        "文档和代码一样重要"
        "学会说'我不知道'是成长的开始"
        "复制粘贴代码前要理解每一行"
        "命名是计算机科学中最难的问题"
        "日志是你最好的朋友"
        "备份越多，睡眠越好"
        
        # 幽默吐槽类
        "这段代码半年后只有上帝和我知道，现在只有上帝知道"
        "编程就是将咖啡因转化为代码的过程"
        "我讨厌编程，但我喜欢解决问题"
        "程序员最讨厌的两件事：写文档和别人不写文档"
        "代码能跑就不要动"
        "理论上，理论和实践是一样的。实践上，不是"
        "我的代码在本地是好的"
        "这不是bug，这是特性"
        "当我写代码时，只有我和上帝知道它在做什么。现在只有上帝知道"
        "编程就是在谷歌搜索和复制粘贴之间思考"
        
        # 励志成长类
        "今天写的代码，会让明天的自己感谢"
        "每天学一点，一年后你会惊讶自己的进步"
        "最好的代码是还没写出来的代码"
        "犯错不可怕，可怕的是不从中学习"
        "程序员的价值在于解决问题的能力"
        "保持好奇心，技术永远在更新"
        "读源码比读任何编程书都有用"
        "教别人是巩固知识的最好方法"
        "技术深度和广度同样重要"
        "职业生涯是马拉松，不是百米冲刺"
        
        # 大牛语录类
        "计算机科学就是关于如何制造抽象的艺术 - Harold Abelson"
        "软件Under construction，就像宇宙Under construction一样 - Alan Kay"
        "简单不意味着容易 - Rich Hickey"
        "任何足够先进的技术都与魔法无异 - Arthur C. Clarke"
        "编程是你能掌握的最近乎超能力的东西 - Drew Houston"
        "代码就像是幽默，如果你需要解释，那就不好了 - Cory House"
        "软件设计就是编码，编码就是软件设计 - Jack Reeves"
        "完美不是没有什么可添加，而是没有什么可去掉 - Antoine de Saint-Exupéry"
        "计算机没什么用，它们只会给你答案 - Pablo Picasso"
        "创新就是看到别人都看到的，想到别人没想到的 - Albert Szent-Gyorgyi"
        
        # 现实洞察类
        "需求文档和最终产品的关系就像初恋和婚姻"
        "项目经理说：9个女人1个月不能生一个孩子"
        "用户永远不知道他们想要什么，直到你给他们"
        "开发时间估算 × 3 = 现实时间"
        "代码复杂度与 deadline 成反比"
        "bug的数量与代码行数成正比，与测试时间成反比"
        "最可怕的错误是：该功能在旧版本中正常工作"
        "程序员的三个美德：懒惰、急躁和傲慢 - Larry Wall"
        "如果你认为好代码重要，那你一定没遇到过紧急bug"
        "技术债就像高利贷，越早还利息越少"
        
        # 深度思考类
        "编程语言是工具，思想才是核心"
        "架构设计的本质是管理复杂度"
        "可读性比性能更重要，除非性能成为问题"
        "最好的代码是没有代码"
        "抽象泄漏定律：所有有意义的抽象都会在某种程度上泄漏"
        "你不需要更多的框架，你需要更好的理解"
        "编程的本质是控制复杂度"
        "代码的寿命比硬件长，比程序员职业生涯长"
        "维护代码的时间远超过编写代码的时间"
        "优雅的代码让复杂的事情看起来简单"
        
        # 实用建议类
        "写代码时想象六个月后的维护者是个知道你住址的暴力狂"
        "今天多写一行注释，明天少加一小时班"
        "版本控制是你的时间机器"
        "学会调试比学会编码更重要"
        "读错误信息，不只是看红色"
        " Rubber duck debugging 真的有用"
        "代码格式化不是风格问题，是 readability 问题"
        "小步提交，频繁测试"
        "理解业务比理解技术更重要"
        "保持学习，但不要追逐每一个新技术"
        
        # 幽默真相类
        "我的一半代码在修复另一半年代码的问题"
        "编程：把咖啡变成代码的过程"
        "我的代码没有bug，只是有未文档化的特性"
        "程序员的生活：99% 调试，1% 写新bug"
        "我讨厌编程，但我更讨厌手动做事"
        "最好的代码注释是那些你删除不需要的代码"
        "如果代码能工作，就不要碰它"
        "我不是在写bug，我是在创造独特的用户体验"
        "编程就是用不同的语法犯同样的错误"
        "我的键盘上有两个最常用的键：Ctrl 和 C"
        
        # 智慧箴言类
        "代码质量与解决问题的复杂度成反比"
        "最危险的代码是你认为不会出问题的代码"
        "团队合作就是：你的代码，我的问题"
        "技术选型就像是婚姻，选择容易离婚难"
        "性能优化就像挤牙膏，越到后面越难"
        "文档写得好，加班少不了（反话）"
        "好的架构让对的东西容易做，错的东西难做"
        "编程是细节的魔鬼，也是抽象的天使"
        "你的代码应该像好散文一样易读"
        "技术决策是权衡的艺术，没有完美解"
    )  #zsh只有一维数组,但是它是弱类型的,就相当于python中的列表.
    
    # 随机选择名言
    total_quotes=${#quotes[@]}  #这一句是什么意思?
    #嗯,quotes[]是典型的调用数组的方式,那#和@又是什么意思?
    #${#quotes[@]} 返回数组元素个数
    random_index=$(( RANDOM % total_quotes + 1 ))
    #从这一句可以看出,上一句的结果是一个数字,这一句是在生成一个在名言范围内的随机数.
    random_quote=${quotes[$random_index]}  #这一句看懂了,把这个数组中的一个元素(字符串)赋给一个自定义的变量.
    
    # 定义颜色
    RED='\033[1;31m'  #红色
    GREEN='\033[1;32m'  #绿色?
    YELLOW='\033[1;33m'  #黄色
    BLUE='\033[1;34m'   #蓝色
    PURPLE='\033[1;35m' #紫色?
    CYAN='\033[1;36m'  #灰色?
    WHITE='\033[1;37m'  #white,白色
    NC='\033[0m' # No Color
    #,嗯,类似于html中的字符实体?
    #    作用：定义 ANSI 转义序列用于终端颜色

   # 说明：
   #     \033[：转义序列开始

    #    1;：粗体

     #   31m：红色（32=绿色，33=黄色等）

      #  NC：重置颜色到默认


    #
    #
    #
    #
    # 显示欢迎信息
    echo ""
    echo "${GREEN}==========================================${NC}"
    #定义绿色横线,然后重置颜色到默认
    echo "${CYAN}   欢迎回来，$(whoami)! ${YELLOW}胡成健!${NC}"
    echo "${BLUE}   🕐 ${WHITE}$(date '+%Y-%m-%d %H:%M:%S')${NC}"
    echo "${BLUE}   ⏰ ${WHITE}运行: $uptime_formatted${NC}"
    echo "${BLUE}   💻 ${WHITE}终端: $(tty | sed 's/\/dev\///')${NC}"
    echo ""
    echo "${YELLOW}🚀 系统状态:${NC}"
    echo "   ${GREEN}✅${NC} 编译器就绪    ${GREEN}✅${NC} 咖啡储备充足"
    echo "   ${RED}🐛${NC} 已知bug存在   ${BLUE}🔍${NC} 未知功能待探索"
    echo "   ${PURPLE}⚡${NC} 内核加载完成  ${CYAN}🧠${NC} 脑机接口: 未连接"
    echo ""
    echo "${YELLOW}📊 系统资源:${NC}"
    echo "   ${BLUE}💾${NC} 内存: $memory_usage"
    echo "   ${GREEN}💿${NC} 根目录: $disk_usage"
    echo ""
    echo "${YELLOW}💭 每日名言 (${WHITE}$random_index/${total_quotes}${YELLOW}):${NC}"
    #一开始我以为/是除号,不过原来是一个普通的字符.
    echo "   ${CYAN}\"$random_quote\"${NC}"
    #打印随机到的字符串.
    #   \  是转义符?
    echo "${GREEN}==========================================${NC}"
    echo ""
	#颜色的使用?怎么用?

    
    export WELCOME_SHOWN=true
    #这一句是什么意思?我知道export可以把一个普通变量变成环境变量,不过为什么?
    #为什么要加这一句?
    #
    #    作用：设置环境变量标记欢迎信息已显示

#    说明：

 #       export 使变量在当前shell和子shell中可用

  #      下次登录时 if [ -z "$WELCOME_SHOWN" ] 会检测到这个变量存在


    #
    #
    #
    #
fi


# 在 ~/.zshrc 中使用函数
vim() {
    nvim "$@"
}

alias cat='batcat'
alias catn='/bin/cat'
alias ls='eza'

export NNN_TRASH=0
