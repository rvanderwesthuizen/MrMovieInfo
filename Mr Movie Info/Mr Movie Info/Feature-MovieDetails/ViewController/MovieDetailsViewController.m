//
//  MovieDetailsViewController.m
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/19.
//

#import "MovieDetailsViewModel.h"
#import "MovieDetailsViewController.h"
#import "Mr Movie Info-Swift.h"

@interface MovieDetailsViewController () {
    MovieDetailsViewModel * _viewModel;
    IBOutlet UIScrollView *detailsScrollView;
    IBOutlet UIView *mainInfoView;
    IBOutlet UIButton *addToWatchlistButton;
    IBOutlet UILabel *titleLabel;
    IBOutlet UIImageView *posterImageView;
    IBOutlet UILabel *yearLabel;
    IBOutlet UILabel *releasedLabel;
    IBOutlet UILabel *ratedLabel;
    IBOutlet UILabel *runtimeLabel;
    IBOutlet UILabel *plotLabel;
    IBOutlet UILabel *directorsLabel;
    IBOutlet UILabel *writersLabel;
    IBOutlet UILabel *actorsLabel;
    IBOutlet UILabel *productionLabel;
    IBOutlet UILabel *languageLabel;
    IBOutlet UILabel *genreLabel;
    IBOutlet UILabel *imdbRatingLabel;
    IBOutlet UILabel *boxOfficeLabel;
    IBOutlet UILabel *awardsLabel;
}

@end

@implementation MovieDetailsViewController

-(void)set:(MovieDetails *) movieDetails {
        _viewModel = [[MovieDetailsViewModel alloc] initWithMovieDetails:movieDetails];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Movie Details";
    [self setupView];
}

-(void)setupView {
    detailsScrollView.backgroundColor = MyAppStyle.backgroundColor;
    mainInfoView.backgroundColor = MyAppStyle.backgroundColor;
    self.view.backgroundColor = MyAppStyle.darkBackgroundColor;
    addToWatchlistButton.backgroundColor = MyAppStyle.darkBackgroundColor;
    addToWatchlistButton.tintColor = MyAppStyle.accentColor;
    [posterImageView loadImageWithUrlString: _viewModel.posterURL];
    [self populateAndStyleLabel:titleLabel :MyAppStyle.movieDetailsTitleFont :MyAppStyle.bodyTextColor :_viewModel.title];
    
    [self populateAndStyleLabel:releasedLabel :MyAppStyle.bodyFont :MyAppStyle.bodyTextColor :_viewModel.released];
    [self populateAndStyleLabel:yearLabel :MyAppStyle.bodyFont :MyAppStyle.bodyTextColor :_viewModel.year];
    [self populateAndStyleLabel:ratedLabel :MyAppStyle.bodyFont :MyAppStyle.bodyTextColor :_viewModel.rated];
    [self populateAndStyleLabel:runtimeLabel :MyAppStyle.bodyFont :MyAppStyle.bodyTextColor :_viewModel.runtime];
    
    [self populateAndStyleLabel:plotLabel :MyAppStyle.movieDetailsParagraphFont :MyAppStyle.bodyTextColor :_viewModel.plot];
    [self populateAndStyleLabel:directorsLabel :MyAppStyle.movieDetailsParagraphFont :MyAppStyle.bodyTextColor :_viewModel.directors];
    [self populateAndStyleLabel:writersLabel :MyAppStyle.movieDetailsParagraphFont :MyAppStyle.bodyTextColor :_viewModel.writer];
    [self populateAndStyleLabel:actorsLabel :MyAppStyle.movieDetailsParagraphFont :MyAppStyle.bodyTextColor :_viewModel.actors];
    [self populateAndStyleLabel:productionLabel :MyAppStyle.movieDetailsParagraphFont :MyAppStyle.bodyTextColor :_viewModel.productionStudio];
    [self populateAndStyleLabel:languageLabel :MyAppStyle.movieDetailsParagraphFont :MyAppStyle.bodyTextColor :_viewModel.language];
    [self populateAndStyleLabel:genreLabel :MyAppStyle.movieDetailsParagraphFont :MyAppStyle.bodyTextColor :_viewModel.genre];
    [self populateAndStyleLabel:imdbRatingLabel :MyAppStyle.movieDetailsParagraphFont :MyAppStyle.bodyTextColor :_viewModel.imdbRating];
    [self populateAndStyleLabel:boxOfficeLabel :MyAppStyle.movieDetailsParagraphFont :MyAppStyle.bodyTextColor :_viewModel.boxOffice];
    [self populateAndStyleLabel:awardsLabel :MyAppStyle.movieDetailsParagraphFont :MyAppStyle.bodyTextColor :_viewModel.awards];
}

-(void)populateAndStyleLabel:(UILabel *)label : (UIFont *)font : (UIColor *)color : (NSString *)text {
    label.text = text;
    label.font = font;
    label.textColor = color;
}

- (IBAction)didTapAddButton:(UIButton *)sender {
    [_viewModel addToWatchlist];
}

@end
