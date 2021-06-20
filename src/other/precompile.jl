#! format: off
function _precompile_()
    # pretty
    Base.precompile(Tuple{typeof(pretty),DefaultStyle{NothingStyle},CSTParser.EXPR,State})
    Base.precompile(Tuple{typeof(pretty),DefaultStyle{BlueStyle},CSTParser.EXPR,State})
    Base.precompile(Tuple{typeof(pretty),DefaultStyle{YASStyle},CSTParser.EXPR,State})
    Base.precompile(Tuple{typeof(pretty),YASStyle{NothingStyle},CSTParser.EXPR,State})
    Base.precompile(Tuple{typeof(pretty),BlueStyle{NothingStyle},CSTParser.EXPR,State})
end
