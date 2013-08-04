//
//  TableViewController.m
//  pouch_ios
//
//  Created by Joshua Martin on 8/4/13.
//  Copyright (c) 2013 Joshua Martin. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "AFNetworking.h"

@interface TableViewController ()

@end

@implementation TableViewController

-(void)makeRestuarantRequests
{
    NSURL *url = [NSURL URLWithString:@"http://serene-ridge-8390.herokuapp.com/articles.json"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject)
                                         {
                                             
                                             self.pouchArrayFromAFNetworking = responseObject;
                                              NSLog(@"JSON RESULT %d", self.pouchArrayFromAFNetworking.count);
                                             [self.tableView reloadData];
                                             
                                         }
                                         failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id responseObject)
                                         {
                                             NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
                                         }];
    
    [operation start];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.pouchArrayFromAFNetworking = [[NSMutableArray alloc] init];
    self.finishedPouchArray = [[NSArray alloc] init];
    [self makeRestuarantRequests];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"p2.png"]];

//    [[UINavigationBar appearance] setBackgroundColor:[UIColor blackColor]];
//    [[UINavigationBar appearance] setTitle:@"WAT"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return self.pouchArrayFromAFNetworking.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[self.pouchArrayFromAFNetworking objectAtIndex:section] objectForKey:@"feed"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [[[[self.pouchArrayFromAFNetworking objectAtIndex:indexPath.section] objectForKey:@"feed"] objectAtIndex: indexPath.row] objectForKey:@"title"];
    cell.detailTextLabel.text = [[[[self.pouchArrayFromAFNetworking objectAtIndex:indexPath.section] objectForKey:@"feed"] objectAtIndex: indexPath.row] objectForKey:@"author"];
//    cell.textLabel.text = @"test";
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    ViewController *detailViewController = (ViewController *)segue.destinationViewController;
    detailViewController.page_content = [[[[self.pouchArrayFromAFNetworking objectAtIndex:indexPath.section] objectForKey:@"feed"] objectAtIndex: indexPath.row] objectForKey:@"page_content"];
    detailViewController.article_title = [[[[self.pouchArrayFromAFNetworking objectAtIndex:indexPath.section] objectForKey:@"feed"] objectAtIndex: indexPath.row] objectForKey:@"title"];

}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[self.pouchArrayFromAFNetworking objectAtIndex:section] objectForKey:@"name"];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//#pragma mark - Table view delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    /*
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//     */
//}

@end
