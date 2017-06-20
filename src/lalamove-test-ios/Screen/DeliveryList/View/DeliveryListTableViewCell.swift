//
//  DeliveryListTableViewCell.swift
//  lalamove-test-ios
//
//  Created by Derek Cheung on 21/6/2017.
//  Copyright © 2017 Derek Cheung. All rights reserved.
//

import StakkKit
import SDWebImage

class DeliveryListTableViewCell: SFBaseTableViewCell {

	// MARK: - Constants

	struct Constants {

		static let itemImageViewHeight: CGFloat = 100.0
		static let itemImageViewWidth: CGFloat = 100.0
		static let itemImageViewPadding: CGFloat = 10.0
		static let titleLabelHorizontalPadding: CGFloat = 10.0
	}

	// MARK: - Variables

	var itemImageView: UIImageView!
	var titleLabel: UILabel!
	
	public var model: DeliveryItem? {

		didSet {

			self.titleLabel.text = model?.deliveryDescription
			self.itemImageView.sd_setImage(with: model?.imageUrl)
		}
	}

	// MARK: - Setup

	override func setup() {

		super.setup()

		self.bottomSeparator.isHidden = false
		self.bottomSeparator.backgroundColor = UIColor.lightGray

		self.setupItemImageView()
		self.setupTitleLabel()
	}

	func setupItemImageView() {

		self.itemImageView = UIImageView.newAutoLayout()

		self.itemImageView.contentMode = UIViewContentMode.scaleAspectFill
		self.itemImageView.clipsToBounds = true;
	}

	func setupTitleLabel() {

		self.titleLabel = UILabel.newAutoLayout()

		self.titleLabel.numberOfLines = 2
		self.titleLabel.textColor = UIColor.darkGray
	}

	// MARK: - Setup Layer

	override func setupLayer() {

		super.setupLayer()

		self.contentView.addSubview(self.itemImageView)
		self.contentView.addSubview(self.titleLabel)
	}

	// MARK: - Setup Constraints

	override func setupConstraints() {

		super.setupConstraints()

		self.setupItemImageViewContraints()
		self.setupTitleLabelConstraints()
	}

	func setupItemImageViewContraints() {

		self.itemImageView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.init(top: Constants.itemImageViewPadding,
		                                                                        left: Constants.itemImageViewPadding,
		                                                                        bottom: Constants.itemImageViewPadding,
		                                                                        right: 0),
		                                                excludingEdge: ALEdge.right)

		self.itemImageView.autoSetDimension(ALDimension.width, toSize: Constants.itemImageViewWidth)
	}

	func setupTitleLabelConstraints() {

		self.titleLabel.autoPinEdge(ALEdge.left, to:ALEdge.right, of: self.itemImageView, withOffset: Constants.titleLabelHorizontalPadding)
		self.titleLabel.autoPinEdge(toSuperviewEdge: ALEdge.top)
		self.titleLabel.autoPinEdge(toSuperviewEdge: ALEdge.bottom)
		self.titleLabel.autoPinEdge(toSuperviewEdge: ALEdge.right, withInset: Constants.titleLabelHorizontalPadding)
	}

	// MARK: - Public

	public class func height() -> CGFloat {

		return Constants.itemImageViewHeight + Constants.itemImageViewPadding * 2;
	}
}
