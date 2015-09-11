//
//  MasterViewController.m
//  Sample App
//
//  Created by Paul Galasso on 9/9/15.
//  Copyright (c) 2015 Mark Angeles. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "MovieCell.h"

@interface MasterViewController () {
    
    NSOperationQueue *que;
    
    UIView *viewActivity;
}

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        viewActivity = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.window.frame.size.width, self.view.window.frame.size.height)];
        viewActivity.backgroundColor = [UIColor blackColor];
        viewActivity.alpha = 0.8;
        
        UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [activity startAnimating];
        activity.frame = CGRectMake(0, 0, viewActivity.frame.size.width, viewActivity.frame.size.height);
        [viewActivity addSubview:activity];
        [self.view.window addSubview:viewActivity];
        
    });
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    self.objects = @[].mutableCopy;
    
    que = [[NSOperationQueue alloc]init];
    que.maxConcurrentOperationCount = 2;
    // Do any additional setup after loading the view, typically from a nib.

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    Webservice *webserviceGet = [[Webservice alloc]init];
    webserviceGet.link = @"https://dl.dropboxusercontent.com/u/5624850/movielist/list_movies_page1.json";
    webserviceGet.delegate = self;
    [webserviceGet sendPostWithParameter:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MovieInformationObject *selectedMovie = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setMovieObject:selectedMovie];
    
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    MovieCell *movieCell = [tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    
    MovieInformationObject *movieObject = self.objects[indexPath.row];
    movieCell.labelTitle.text = [NSString stringWithFormat:@"%@",movieObject.title];
    movieCell.labelDate.text = [NSString stringWithFormat:@"%@",movieObject.year];
    [movieCell setupView];
    
    movieCell.imageBackground.image = nil;
    
    if (movieObject.imageBackground) {
        
        movieCell.imageBackground.image = [UIImage imageWithData:movieObject.imageBackground];
        
    }
    
    return movieCell;

}

- (MovieCell *)cellAtIndexPath: (NSIndexPath *)indexPath {
    
    MovieCell *movieCell = [self.tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];

    MovieInformationObject *movieObject = self.objects[indexPath.row];
    movieCell.labelTitle.text = [NSString stringWithFormat:@"%@",movieObject.title];
    movieCell.labelDate.text = [NSString stringWithFormat:@"%@",movieObject.year];
    [movieCell setupView];
    
    if (movieObject.imageBackground) {
        movieCell.imageBackground.frame = CGRectMake(0, 0, CGRectGetWidth(movieCell.contentView.frame), CGRectGetHeight(movieCell.contentView.frame));
        movieCell.imageBackground.image = [UIImage imageWithData:movieObject.imageBackground];
        
        [movieCell.contentView addSubview:movieCell.imageBackground];
        
    }
    
    return movieCell;
    
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
}
#pragma mark - Webservice Delegate
- (void)webserviceReceivedData:(id)object {
    
//    NSLog(@"Onject = %@",object);
    NSDictionary *dictionaryResponse = (NSDictionary *)object;
    
    if ([dictionaryResponse[@"status_message"] isEqualToString:@"Query was successful"]) {
        
        NSDictionary *dictionaryData = dictionaryResponse[@"data"];
        NSArray *arrayMovies = dictionaryData[@"movies"];
     
        
        for (NSDictionary *movies in arrayMovies) {
            
            MovieInformationObject *movieModel = [[MovieInformationObject alloc]init];
            [movieModel.genres addObjectsFromArray:movies[@"genres"]];
            movieModel.identifier = movies[@"id"];
            movieModel.language = movies[@"language"];
            movieModel.imdbCode = movies[@"imdb_code"];
            movieModel.mpaRating= movies[@"mpa_rating"];
            movieModel.overview = movies[@"overview"];
            movieModel.rating = movies[@"rating"];
            movieModel.runtime = movies[@"runtime"];
            movieModel.slug = movies[@"slug"];
            movieModel.state = movies[@"state"];
            movieModel.title = movies[@"title"];
            movieModel.titleLong = movies[@"title_long"];
            movieModel.url = movies[@"url"];
            movieModel.year = movies[@"year"];
            
            [self.objects addObject:movieModel];
            
            ImageDownloader *downloaderBackground = [[ImageDownloader alloc]initWithLink:movieModel.backgroundImage];
            downloaderBackground.identifier = [NSString stringWithFormat:@"%lu-background",(unsigned long)self.objects.count];
            downloaderBackground.delegate = self;
            
            ImageDownloader *downloaderCover = [[ImageDownloader alloc]initWithLink:movieModel.coverImage];
            downloaderCover.identifier = [NSString stringWithFormat:@"%lu-cover",(unsigned long)self.objects.count];
            downloaderCover.delegate = self;
//            
            [que addOperation:downloaderBackground];
            [que addOperation:downloaderCover];
            
            
        }
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            
            [self.detailViewController setMovieObject:self.objects[0]];
            
        }
        viewActivity.hidden = YES;
        [self.tableView reloadData];
        
        
    }else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Cannot connect to the server" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    
//    NSLog(@"%@",dictionaryResponse);
}

#pragma mark - Image Downloader
- (void)imageDownloader:(ImageDownloader *)downloader downloadedImage:(NSData *)data {
   
    NSArray *downloadIdentifier = [downloader.identifier componentsSeparatedByString:@"-"];
    int index = [downloadIdentifier[0] intValue] - 1;
    MovieInformationObject *movieObject = self.objects[index];
    if ([downloadIdentifier[1] isEqualToString:@"cover"]) {
        movieObject.imageCover = [[NSData alloc]initWithData:data];
        [self.objects replaceObjectAtIndex:index withObject:movieObject];
       
    }else {
        movieObject.imageBackground = [[NSData alloc]initWithData:data];
        [self.objects replaceObjectAtIndex:index withObject:movieObject];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            
        });
        
        
    }
    
}









@end
