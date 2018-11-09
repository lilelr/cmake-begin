
# cmake macro usages
message("\n function_macro_usages")

# 定义一个宏，显式声明了两个参数hello,world
macro(argn_test hello world)
    MESSAGE(STATUS ARGV=${ARGV})
    MESSAGE(STATUS ARGN=${ARGN})
    MESSAGE(STATUS ARGV0=${ARGV0})
    MESSAGE(STATUS ARGV1=${ARGV1})
    MESSAGE(STATUS ARGV2=${ARGV2})
    MESSAGE(STATUS ARGV3=${ARGV3})
endmacro()
# 调用宏时传入4个参数
argn_test(TOM JERRY SUSAN BERN)
#---------------------
#作者：10km
#来源：CSDN
#原文：https://blog.csdn.net/10km/article/details/83027824
#版权声明：本文为博主原创文章，转载请附上博文链接！
message("\n")

set(var "ABC")

macro(Moo arg)
    message("arg = ${arg}")
    set(arg "abc")
    message("# After change the value of arg.")
    message("arg = ${arg}")
endmacro()
message("=== Call macro ===")
Moo(${var})

function(Foo arg)
    message("arg = ${arg}")
    set(arg "abc")
    message("# After change the value of arg.")
    message("arg = ${arg}")
endfunction()
message("=== Call function ===")
Foo(${var})
message("\n")

set(var1 "abc")

function(f1 arg)
    set(${arg} "ABC" PARENT_SCOPE) # ${arg} == var, 于是相当于　set (var1 "ABC" PARENT_SCOPE)
endfunction()

message("before calling f1, var1 = ${var1}")
f1(var1)  # 如果写成了f1(${var1})会怎样？
message("after calling f1, var1 = ${var1}")
message("\n")

#---------------------
#作者：elloop
#来源：CSDN
#原文：https://blog.csdn.net/elloop/article/details/51130395
#版权声明：本文为博主原创文章，转载请附上博文链接！

#如何传递列表类型的参数？

set(arg2 hello world)
foreach(v ${arg2})
    message(${v})
endforeach()
message("\n")

function(print_list arg)
    foreach(v ${arg})
        message(${v})
    endforeach()
endfunction()

#print_list(${arg2}) 错误　print_list(${arg}) 展开来看就是 print_list(hello world), 因此，传递给print_list的第一个参数只有hello。
#  正确的调用方式应该是下面这样，使用双引号把参数括起来:
print_list("${arg2}")
message("\n")


function(print_list arg)
    message("======= args count : ${ARGC} ======= ")    # 实际实参个数

    message("======= all args ======= ")                # 打印所有参数
    foreach(v IN LISTS ARGV)
        message(${v})
    endforeach()


    message("======= all extra args ======= ")          # 打印所有额外参数
    foreach(v IN LISTS ARGN)
        message(${v})
    endforeach()

    message("======= print content of ARGV0 ======= ")  # 打印第一个参数里的所有内容
    foreach(v IN LISTS ARGV0)
        message(${v})
    endforeach()
endfunction()

set(arg hello world)

message("------------ calling with qutoes -----------")     # 使用引号来调用
print_list("${arg}")

message("------------ calling without qutoes -----------")  # 不使用引号调用
print_list(${arg})

message("\n")

#---------------------
#作者：elloop
#来源：CSDN
#原文：https://blog.csdn.net/elloop/article/details/51130395
#版权声明：本文为博主原创文章，转载请附上博文链接！



# CMake里的函数支持递归调用吗？
message("CMake里的函数支持递归调用吗？")

file(GLOB_RECURSE cpp_list ./*.cpp)

#这个file命令，使用GLOB_RECURSE参数的时候即表示递归搜索的意思，上面这句话的意思是递归搜索当前目录及其子目录下的所有.cpp文件，把其完整路径放入列表cpp_list中。

function(include_sub_directories_recursively root_dir)
    if (IS_DIRECTORY ${root_dir})               # 当前路径是一个目录吗，是的话就加入到包含目录
        message("include dir: " ${root_dir})
        include_directories(${root_dir})
    endif()

    file(GLOB ALL_SUB RELATIVE ${root_dir} ${root_dir}/*) # 获得当前目录下的所有文件，让如ALL_SUB列表中
    foreach(sub ${ALL_SUB})
        if (IS_DIRECTORY ${root_dir}/${sub})
            include_sub_directories_recursively(${root_dir}/${sub}) # 对子目录递归调用，包含
        endif()
    endforeach()
endfunction()
#---------------------
#作者：elloop
#来源：CSDN
#原文：https://blog.csdn.net/elloop/article/details/51130395
#版权声明：本文为博主原创文章，转载请附上博文链接！