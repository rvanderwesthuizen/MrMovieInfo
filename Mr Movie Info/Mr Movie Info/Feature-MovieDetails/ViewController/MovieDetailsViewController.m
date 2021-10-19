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
    IBOutlet UILabel *releaseLabel;
    IBOutlet UILabel *ratedLabel;
    IBOutlet UILabel *runtimeLabel;
    IBOutlet UILabel *plotLabel;
    IBOutlet UILabel *languageLabel;
    IBOutlet UILabel *genreLabel;
    IBOutlet UILabel *writersLabel;
    IBOutlet UILabel *directorLabel;
    IBOutlet UILabel *actorsLabel;
    IBOutlet UILabel *productionStudioLabel;
    IBOutlet UILabel *imdbRatingLabel;
    IBOutlet UILabel *boxOfficeLabel;
    IBOutlet UILabel *awardsLabel;
}

@end

@implementation MovieDetailsViewController

- (instancetype)initWithMovieDetails:(MovieDetails *)movieDetails {
    self = [super init];
    if (self) {
        self.movieDetails = movieDetails;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewModel];
}

-(void)setupViewModel {
    if (!_viewModel) {
        _viewModel = [[MovieDetailsViewModel alloc] initWithMovieDetails:_movieDetails];
    }
}

-(void)setupView {
    [posterImageView loadImageWithUrlString:_viewModel.posterURL];
    titleLabel.text = _viewModel.title;
    yearLabel.text = _viewModel.year;
    releaseLabel.text = _viewModel.released;
    ratedLabel.text = _viewModel.rated;
    runtimeLabel.text = _viewModel.runtime;
    plotLabel.text = _viewModel.plot;
    languageLabel.text = _viewModel.language;
    genreLabel.text = _viewModel.genre;
    writersLabel.text = _viewModel.writer;
    directorLabel.text = _viewModel.directors;
    actorsLabel.text = _viewModel.actors;
    productionStudioLabel.text = _viewModel.productionStudio;
    imdbRatingLabel.text = _viewModel.imdbRating;
    boxOfficeLabel.text = _viewModel.boxOffice;
    awardsLabel.text = _viewModel.awards;
}

@end
