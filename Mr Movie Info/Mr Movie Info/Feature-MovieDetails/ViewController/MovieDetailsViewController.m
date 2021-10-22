//
//  MovieDetailsViewController.m
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/19.
//

#import "MovieDetailsViewModel.h"
#import "MovieDetailsViewController.h"

@interface MovieDetailsViewController () {
    MovieDetailsViewModel * _viewModel;
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
    [posterImageView loadImageWithUrlString: _viewModel.posterURL];
    titleLabel.text = _viewModel.title;
    yearLabel.text = [NSString stringWithFormat:@"Year: %@", _viewModel.year];
    releasedLabel.text = [NSString stringWithFormat:@"Release data: %@", _viewModel.released];
    ratedLabel.text = _viewModel.rated;
    runtimeLabel.text = _viewModel.runtime;
    plotLabel.text = _viewModel.plot;
    directorsLabel.text = _viewModel.directors;
    writersLabel.text = _viewModel.writer;
    actorsLabel.text = _viewModel.actors;
    productionLabel.text = _viewModel.productionStudio;
    languageLabel.text = _viewModel.language;
    genreLabel.text = _viewModel.genre;
    imdbRatingLabel.text = _viewModel.imdbRating;
    boxOfficeLabel.text = _viewModel.boxOffice;
    awardsLabel.text = _viewModel.awards;
}
- (IBAction)didTapAddButton:(UIButton *)sender {
    [_viewModel addToWatchlist];
}

@end
