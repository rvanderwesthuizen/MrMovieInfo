//
//  MovieDetailsViewModel.h
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/19.
//

#import <Foundation/Foundation.h>
#import "SearchMDFramework-Swift.h"
@class MovieDetails;

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetailsViewModel : NSObject
- (instancetype)initWithMovieDetails:(MovieDetails *)movieDetails;

-(void) addToWatchlist;
-(NSString *) title;
-(NSString *) year;
-(NSString *) posterURL;
-(NSString *) rated;
-(NSString *) released;
-(NSString *) plot;
-(NSString *) runtime;
-(NSString *) genre;
-(NSString *) directors;
-(NSString *) writer;
-(NSString *) actors;
-(NSString *) language;
-(NSString *) awards;
-(NSString *) imdbRating;
-(NSString *) boxOffice;
-(NSString *) productionStudio;

@end

NS_ASSUME_NONNULL_END
