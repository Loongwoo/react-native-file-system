import CommonCrypto

extension String {
    /**
     * Normalize standard file system paths and file URIs.
     */
    func path() -> String {
        if self.contains("://"), let pathUri = URL(string: self) {
            return pathUri.path
        }
        return self
    }

    /**
     - returns: the String, as an MD5 hash.
     */
    var md5: String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)

        let hash = NSMutableString()

        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }

        result.deallocate()
        return hash as String
    }

    func indexOf(value: Character) -> Int? {
        if let index = self.firstIndex(of: value) {
            return self.distance(from: self.startIndex, to: index)
        } else {
            return nil
        }
    }

    func lastIndexOf(value: Character) -> Int? {
        if let index = self.lastIndex(of: value) {
            return self.distance(from: self.startIndex, to: index)
        } else {
            return nil
        }
    }

    func substring(startIndex: Int) -> String {
        if let index = self.index(self.startIndex, offsetBy: startIndex, limitedBy: self.endIndex) {
            return String(self[index...])
        } else {
            return ""
        }
    }

    func substring(startIndex: Int, length: Int) -> String {
        if let start = self.index(self.startIndex, offsetBy: startIndex, limitedBy: self.endIndex) {
            if let end = self.index(self.startIndex, offsetBy: startIndex + length, limitedBy: self.endIndex) {
                return String(self[start..<end])
            } else {
                return String(self[start...])
            }
        } else {
            return ""
        }
    }
}
