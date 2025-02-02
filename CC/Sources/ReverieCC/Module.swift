import ControlCenterUIKit

final class Module: CCUIToggleModule {
    override var isSelected: Bool {
        get { false }
        set { sleepDart() }
    }
    
    override var iconGlyph: UIImage {
        UIImage(named: "CCIcon", in: Bundle(for: type(of: self)), compatibleWith: nil)
	// return [UIImage imageNamed:@"CCIcon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    }
    
    private func sleepDart() {
        CFNotificationCenterPostNotification(
            CFNotificationCenterGetDarwinNotifyCenter(),
            CFNotificationName("lilliana.reverie.external" as CFString),
            nil,
            nil,
            true
        )
    }
}

private extension UIImage {
    func scaled() -> UIImage {
        let size: CGSize = .init(width: 36, height: 36)
        let renderer: UIGraphicsImageRenderer = .init(size: size)
        let scaledImg: UIImage = renderer.image { _ in self.draw(in: CGRect(origin: .zero, size: size)) }
        
        return scaledImg
    }
}
