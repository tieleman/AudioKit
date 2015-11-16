//
//  AKAUPeakLimiterWindow.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#if os(OSX)
    import Foundation
    import Cocoa

    /// A Window to control AKAUPeakLimiter in Playgrounds
    public class AKAUPeakLimiterWindow: NSWindow {

        private let windowWidth = 400
        private let padding = 30
        private let sliderHeight = 20
        private let numberOfComponents = 3

        /// Slider to control attackTime
        public let attackTimeSlider: NSSlider
        /// Slider to control decayTime
        public let decayTimeSlider: NSSlider
        /// Slider to control preGain
        public let preGainSlider: NSSlider

        private let attackTimeTextField: NSTextField
        private let decayTimeTextField: NSTextField
        private let preGainTextField: NSTextField

        private var peakLimiter: AKAUPeakLimiter

        /// Initiate the AKAUPeakLimiter window
        public init(_ control: AKAUPeakLimiter) {
            peakLimiter = control
            let sliderWidth = windowWidth - 2 * padding

            attackTimeSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            decayTimeSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            preGainSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))

            attackTimeTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            decayTimeTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            preGainTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))

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
            self.title = "AKAUPeakLimiter"

            let viewRect = NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight)
            let view = NSView(frame: viewRect)

            let topTitle = NSTextField()
            topTitle.stringValue = "AKAUPeakLimiter"
            topTitle.editable = false
            topTitle.drawsBackground = false
            topTitle.bezeled = false
            topTitle.alignment = NSCenterTextAlignment
            topTitle.font = NSFont(name: "Lucida Grande", size: 24)
            topTitle.sizeToFit()
            topTitle.frame.origin.x = CGFloat(windowWidth / 2) - topTitle.frame.width / 2
            topTitle.frame.origin.y = CGFloat(windowHeight - padding) - topTitle.frame.height
            view.addSubview(topTitle)

            attackTimeTextField.stringValue = "Attack Time: \(peakLimiter.attackTime) Secs"
            attackTimeTextField.editable = false
            attackTimeTextField.drawsBackground = false
            attackTimeTextField.bezeled = false
            attackTimeTextField.frame.origin.y = topTitle.frame.origin.y -  2 *  CGFloat(sliderHeight)
            view.addSubview(attackTimeTextField)

            attackTimeSlider.target = self
            attackTimeSlider.action = "updateAttacktime"
            attackTimeSlider.minValue = 0.001
            attackTimeSlider.maxValue = 0.03
            attackTimeSlider.floatValue = Float(peakLimiter.attackTime)
            attackTimeSlider.frame.origin.y = topTitle.frame.origin.y - 3 * CGFloat(sliderHeight)
            view.addSubview(attackTimeSlider)
            decayTimeTextField.stringValue = "Decay Time: \(peakLimiter.decayTime) Secs"
            decayTimeTextField.editable = false
            decayTimeTextField.drawsBackground = false
            decayTimeTextField.bezeled = false
            decayTimeTextField.frame.origin.y = topTitle.frame.origin.y -  5 *  CGFloat(sliderHeight)
            view.addSubview(decayTimeTextField)

            decayTimeSlider.target = self
            decayTimeSlider.action = "updateDecaytime"
            decayTimeSlider.minValue = 0.001
            decayTimeSlider.maxValue = 0.06
            decayTimeSlider.floatValue = Float(peakLimiter.decayTime)
            decayTimeSlider.frame.origin.y = topTitle.frame.origin.y - 6 * CGFloat(sliderHeight)
            view.addSubview(decayTimeSlider)
            preGainTextField.stringValue = "Pre Gain: \(peakLimiter.preGain) dB"
            preGainTextField.editable = false
            preGainTextField.drawsBackground = false
            preGainTextField.bezeled = false
            preGainTextField.frame.origin.y = topTitle.frame.origin.y -  8 *  CGFloat(sliderHeight)
            view.addSubview(preGainTextField)

            preGainSlider.target = self
            preGainSlider.action = "updatePregain"
            preGainSlider.minValue = -40
            preGainSlider.maxValue = 40
            preGainSlider.floatValue = Float(peakLimiter.preGain)
            preGainSlider.frame.origin.y = topTitle.frame.origin.y - 9 * CGFloat(sliderHeight)
            view.addSubview(preGainSlider)

            self.contentView!.addSubview(view)
            self.makeKeyAndOrderFront(nil)
        }

        private func updateAttacktime() {
            peakLimiter.attackTime = attackTimeSlider.floatValue
            attackTimeTextField.stringValue = "Attack Time \(String(format: "%0.4f", peakLimiter.attackTime)) Secs"
        }
        private func updateDecaytime() {
            peakLimiter.decayTime = decayTimeSlider.floatValue
            decayTimeTextField.stringValue = "Decay Time \(String(format: "%0.4f", peakLimiter.decayTime)) Secs"
        }
        private func updatePregain() {
            peakLimiter.preGain = preGainSlider.floatValue
            preGainTextField.stringValue = "Pre Gain \(String(format: "%0.4f", peakLimiter.preGain)) dB"
        }

        /// Required initializer
        required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

#endif
