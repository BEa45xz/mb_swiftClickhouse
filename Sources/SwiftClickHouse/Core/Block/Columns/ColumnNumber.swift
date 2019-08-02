import Foundation

class ColumnNumber {
    static func load(num_rows : UInt64, type : ClickHouseType, socketReader : mbSocketReader, nulls: [Bool]? = nil) -> [ClickHouseValue]? {
        var add : ((mbSocketReader) -> NSNumber?);

        switch (type) {
            case .UInt8 :
                add = ColumnNumber.addUInt8;
                break;

            case .Int8 :
                add = ColumnNumber.addInt8;
                break;

            case .UInt16 :
                add = ColumnNumber.addUInt16;
                break;

            case .Int16 :
                add = ColumnNumber.addInt16;
                break;

            case .UInt32 :
                add = ColumnNumber.addUInt32;
                break;

            case .Int32 :
                add = ColumnNumber.addInt32;
                break;

            case .UInt64 :
                add = ColumnNumber.addUInt64;
                break;

            case .Int64 :
                add = ColumnNumber.addInt64;
                break;

            case .Float32 :
                add = ColumnNumber.addFloat
                break;

            case .Float64 :
                add = ColumnNumber.addDouble;
                break;

            default :
                return nil;
        }

        var list = [ClickHouseValue]();
        for i in 0..<num_rows {
            if let t = add(socketReader) {
                list.append(ClickHouseValue(type: type, number: t, isNull: ColumnNumber.isNull(i, nulls: nulls)));
            } else {
                return nil;
            }
        }

        return list;
    }

    private static func isNull(_ i : UInt64, nulls: [Bool]? = nil) -> Bool {
        if let nulls = nulls {
            return nulls[Int(i)];
        }

        return false;
    }

    private static func addUInt8(socketReader : mbSocketReader) -> NSNumber? {
        if let t : UInt8 = socketReader.readInt() {
            return NSNumber(value : t);
        }

        return nil;
    }

    private static func addInt8(socketReader : mbSocketReader) -> NSNumber? {
        if let t : Int8 = socketReader.readInt() {
            return NSNumber(value : t);
        }

        return nil;
    }

    private static func addUInt16(socketReader : mbSocketReader) -> NSNumber? {
        if let t : UInt16 = socketReader.readInt() {
            return NSNumber(value : t);
        }

        return nil;
    }

    private static func addInt16(socketReader : mbSocketReader) -> NSNumber? {
        if let t : Int16 = socketReader.readInt() {
            return NSNumber(value : t);
        }

        return nil;
    }

    private static func addUInt32(socketReader : mbSocketReader) -> NSNumber? {
        if let t : UInt32 = socketReader.readInt() {
            return NSNumber(value : t);
        }

        return nil;
    }

    private static func addInt32(socketReader : mbSocketReader) -> NSNumber? {
        if let t : Int32 = socketReader.readInt() {
            return NSNumber(value : t);
        }

        return nil;
    }

    private static func addUInt64(socketReader : mbSocketReader) -> NSNumber? {
        if let t : UInt64 = socketReader.readInt() {
            return NSNumber(value : t);
        }

        return nil;
    }

    private static func addInt64(socketReader : mbSocketReader) -> NSNumber? {
        if let t : Int64 = socketReader.readInt() {
            return NSNumber(value : t);
        }

        return nil;
    }

    private static func addFloat(socketReader : mbSocketReader) -> NSNumber? {
        if let t : Float = socketReader.readFloat() {
            return NSNumber(value : t);
        }

        return nil;
    }

    private static func addDouble(socketReader : mbSocketReader) -> NSNumber? {
        if let t : Double = socketReader.readDouble() {
            return NSNumber(value : t);
        }

        return nil;
    }
}
