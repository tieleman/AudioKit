//
//  AKAUTimePitchWindow.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#if os(OSX)
    import Foundation
    import Cocoa

    /// A Window to control AKAUTimePitch in Playgrounds
    public class AKAUTimePitchWindow: NSWindow {

        private let numberOfComponents = 3
        private let windowWidth = 400
        private let padding = 30
        private let sliderHeight = 20

        /// Slider to control rate
        public let rateSlider: NSSlider
        /// Slider to control pitch
        public let pitchSlider: NSSlider
        /// Slider to control overlap
        public let overlapSlider: NSSlider

        private let rateTextField: NSTextField
        private let pitchTextField: NSTextField
        private let overlapTextField: NSTextField

        private var timePitch: AKAUTimePitch

        /// Initiate the AKAUTimePitch window
        public init(_ control: AKAUTimePitch) {
            timePitch = control
            let sliderWidth = windowWidth - 2 * padding

            rateSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            pitchSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            overlapSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))

            rateTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            pitchTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            overlapTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))

            let titleHeightApproximation = 50
            let windowHeight = padding * 2 + titleHeightApproximation + numberOfComponents * 3 * sliderHeight

            super.init(contentRect: NSRect(x: padding, y: padding, width: windowWidth, height: windowHeight),
                styleMask: NSTitledWindowMask,
                backing: .Buffered,
                `defer`: false)
            self.hasShadow = true
            self.styleMask = NSBorderlessWindowMask | NSResizableWindowMask
            self.movableByWindowBackground = true
            self.level = 7
            self.title = "AKAUTimePitch"

            let viewRect = NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight)
            let view = NSView(frame: viewRect)

            let topTitle = NSTextField()
            topTitle.stringValue = "AKAUTimePitch"
            topTitle.editable = false
            topTitle.drawsBackground = false
            topTitle.bezeled = false
            topTitle.alignment = NSCenterTextAlignment
            topTitle.font = NSFont(name: "Lucida Grande", size: 24)
            topTitle.sizeToFit()
            topTitle.frame.origin.x = CGFloat(windowWidth / 2) - topTitle.frame.width / 2
            topTitle.frame.origin.y = CGFloat(windowHeight - padding) - topTitle.frame.height
            view.addSubview(topTitle)

            rateTextField.stringValue = "Rate: \(timePitch.rate) x normal playback rate"
            rateTextField.editable = false
            rateTextField.drawsBackground = false
            rateTextField.bezeled = false
            rateTextField.frame.origin.y = topTitle.frame.origin.y -  2 *  CGFloat(sliderHeight)
            view.addSubview(rateTextField)

            rateSlider.target = self
            rateSlider.action = "updateRate"
            rateSlider.minValue = 0.03125
            rateSlider.maxValue = 32.0
            rateSlider.floatValue = Float(timePitch.rate)
            rateSlider.frame.origin.y = topTitle.frame.origin.y - 3 * CGFloat(sliderHeight)
            view.addSubview(rateSlider)
            pitchTextField.stringValue = "Pitch: \(timePitch.pitch) Cents"
            pitchTextField.editable = false
            pitchTextField.drawsBackground = false
            pitchTextField.bezeled = false
            pitchTextField.frame.origin.y = topTitle.frame.origin.y -  5 *  CGFloat(sliderHeight)
            view.addSubview(pitchTextField)

            pitchSlider.target = self
            pitchSlider.action = "updatePitch"
            pitchSlider.minValue = -2400
            pitchSlider.maxValue = 2400
            pitchSlider.floatValue = Float(timePitch.pitch)
            pitchSlider.frame.origin.y = topTitle.frame.origin.y - 6 * CGFloat(sliderHeight)
            view.addSubview(pitchSlider)
            overlapTextField.stringValue = "Overlap: \(timePitch.overlap) generic"
            overlapTextField.editable = false
            overlapTextField.drawsBackground = false
            overlapTextField.bezeled = false
            overlapTextField.frame.origin.y = topTitle.frame.origin.y -  8 *  CGFloat(sliderHeight)
            view.addSubview(overlapTextField)

            overlapSlider.target = self
            overlapSlider.action = "updateOverlap"
            overlapSlider.minValue = 3.0
            overlapSlider.maxValue = 32.0
            overlapSlider.floatValue = Float(timePitch.overlap)
            overlapSlider.frame.origin.y = topTitle.frame.origin.y - 9 * CGFloat(sliderHeight)
            view.addSubview(overlapSlider)

            self.contentView!.addSubview(view)
            self.makeKeyAndOrderFront(nil)
        }

        private func updateRate() {
            timePitch.rate = rateSlider.floatValue
            rateTextField.stringValue = "Rate \(String(format: "%0.4f", timePitch.rate)) x normal playback rate"
        }
        private func updatePitch() {
            timePitch.pitch = pitchSlider.floatValue
            pitchTextField.stringValue = "Pitch \(String(format: "%0.4f", timePitch.pitch)) Cents"
        }
        private func updateOverlap() {
            timePitch.overlap = overlapSlider.floatValue
            overlapTextField.stringValue = "Overlap \(String(format: "%0.4f", timePitch.overlap)) generic"
        }
        
        /// Required Initializer
        required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

#endif
