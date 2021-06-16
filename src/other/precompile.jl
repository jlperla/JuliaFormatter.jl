#! format: off
function _precompile_()
    # pretty
    Base.precompile(Tuple{typeof(pretty),DefaultStyle{NothingStyle},CSTParser.EXPR,State})
    Base.precompile(Tuple{typeof(pretty),DefaultStyle{YASStyle},CSTParser.EXPR,State})
    Base.precompile(Tuple{typeof(pretty),DefaultStyle{BlueStyle},CSTParser.EXPR,State})
    Base.precompile(Tuple{typeof(pretty),YASStyle{NothingStyle},CSTParser.EXPR,State})
    Base.precompile(Tuple{typeof(pretty),BlueStyle{NothingStyle},CSTParser.EXPR,State})

    #
    # these don't improve timings ???
    #

    Base.precompile(Tuple{typeof(format_text),CSTParser.EXPR,DefaultStyle{NothingStyle},State})
    Base.precompile(Tuple{typeof(format_text),CSTParser.EXPR,YASStyle{NothingStyle},State})
    Base.precompile(Tuple{typeof(format_text),CSTParser.EXPR,BlueStyle{NothingStyle},State})

    Base.precompile(Tuple{typeof(nest!),DefaultStyle{NothingStyle},FST,State})
    Base.precompile(Tuple{typeof(nest!),DefaultStyle{YASStyle},FST,State})
    Base.precompile(Tuple{typeof(nest!),DefaultStyle{BlueStyle},FST,State})
    Base.precompile(Tuple{typeof(nest!),YASStyle{NothingStyle},FST,State})
    Base.precompile(Tuple{typeof(nest!),YASStyle{BlueStyle},FST,State})
    Base.precompile(Tuple{typeof(nest!),BlueStyle{NothingStyle},FST,State})
end
