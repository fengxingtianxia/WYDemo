//
//  NewsCell.m
//  新闻
//
//  Created by yangfeng on 15/12/27.
//  Copyright © 2015年 yangfeng. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"
#import <UIImageView+AFNetworking.h>

@interface NewsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *digest;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *replayLabel;

@end


@implementation NewsCell

- (void)awakeFromNib {

    self.digest.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - self.digest.frame.origin.x - 16;

}


- (void)setNews:(News *)news{

    _news = news;
    self.title.text = news.title;
    self.digest.text = news.digest;
    self.replayLabel.text = [NSString stringWithFormat:@"%d",news.replyCount];
    
    [self.iconView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
