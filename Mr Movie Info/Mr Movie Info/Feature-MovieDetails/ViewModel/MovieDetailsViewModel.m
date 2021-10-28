//
//  MovieDetailsViewModel.m
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/19.
//

#import "MovieDetailsViewModel.h"
#import "Mr Movie Info-Swift.h"

@implementation MovieDetailsViewModel  {
    MovieDetails* _movieDetails;
}

- (instancetype)initWithMovieDetails:(MovieDetails *)movieDetails {
    self = [super init];
    if (self) {
        _movieDetails = movieDetails;
    }
    
    return self;
}

- (void)addToWatchlist {
    DatabaseRepository* repository = [[DatabaseRepository alloc] init];
    [repository addMovieToWatchlistWithDetails:_movieDetails];
}

-(NSString *) title {
    return _movieDetails.title;
}
-(NSString *) year {
    return _movieDetails.year;
}
-(NSString *) posterURL {
    return _movieDetails.poster;
}
-(NSString *) rated {
    return _movieDetails.rated;
}
-(NSString *) released {
    return  _movieDetails.released;
}
-(NSString *) plot {
    return _movieDetails.plot;
}
-(NSString *) runtime {
    return _movieDetails.runtime;
}
-(NSString *) genre {
    return _movieDetails.genre;
}
-(NSString *) directors {
    return _movieDetails.director;
}
-(NSString *) writer {
    return _movieDetails.writer;
}
-(NSString *) actors {
    return _movieDetails.actors;
}
-(NSString *) language {
    return _movieDetails.language;
}
-(NSString *) awards {
    return _movieDetails.awards;
}
-(NSString *) imdbRating {
    return  _movieDetails.imdbRating;
}
-(NSString *) boxOffice {
    return _movieDetails.boxOffice;
}
-(NSString *) productionStudio {
    return _movieDetails.productionStudio;
}

@end
