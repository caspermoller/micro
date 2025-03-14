function onInsertNewline(bp)
    if bp.Buf:FileType() == "python" and string.sub(bp.Buf:Line(bp.Cursor.Y-1), -1) == ":" then
        bp:InsertTab()
    end
end
