//1. Создайте шахматное поле (8х8), используйте черные сабвьюхи
//2. Добавьте балые и красные шашки на черные клетки (используйте начальное расположение в шашках)
//3. Реализуйте механизм драг'н'дроп подобно тому, что я сделал в примере, но с условиями:
//4. Шашки должны ставать в центр черных клеток.
//5. Даже если я отпустил шашку над центром белой клетки - она должна переместиться в центр ближайшей к отпусканию черной клетки.
//6. Шашки не могут становиться друг на друга
//7. Шашки не могут быть поставлены за пределы поля.

#import "ViewController.h"
#import "AZCell.h"
#import "AZChess.h"
#import "AZBoard.h"

static NSInteger const kboardSize = 8;

@interface ViewController ()
@property (assign, nonatomic) NSInteger side;
@property (strong, nonatomic) AZBoard *board;
@property (strong, nonatomic) UIView *dragableView;
@property (assign, nonatomic) CGPoint previousPoint;
@property (strong, nonatomic) AZCell *previousCell;
@property (strong, nonatomic) NSMutableArray * cellsArray;
@property (strong, nonatomic) NSMutableArray * chessArray;
@property (assign, nonatomic) CGPoint offSet;
@property (strong, nonatomic) NSMutableArray *blackCells;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSide];
    [self initBoard];
    [self addCells];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint touchPointOnBoard = self.previousPoint = [touch locationInView: self.board];
    
    for(AZCell *blackCell in self.blackCells){
        if ([blackCell pointInside:touchPointOnBoard withEvent:event]){
            NSLog(@"INSIDE!");
        }
    }
    
    UIView *hitView = [self.board hitTest:touchPointOnBoard withEvent:event];
    if ([hitView isMemberOfClass:AZChess.class]){
        CGPoint touchPoint = [touch locationInView:hitView];
        self.offSet = CGPointMake(
                                  CGRectGetMidX(hitView.bounds) - touchPoint.x,
                                  CGRectGetMidY(hitView.bounds) - touchPoint.y);
        [self.board bringSubviewToFront:hitView];
        self.dragableView = hitView;
    }
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint pointOnBoard = [touch locationInView:self.board];
    CGPoint correctedPoint = CGPointMake(pointOnBoard.x + self.offSet.x,
                                         pointOnBoard.y + self.offSet.y);
    self.dragableView.center = correctedPoint;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.board]; //coords in Board
    AZCell *closestView;
    CGFloat minLength = CGRectGetMaxX(self.board.frame);
    for (AZCell *blackCell in self.blackCells){
        CGPoint center = blackCell.center;
        CGFloat length = sqrtf(pow(point.x-center.x,2) + pow(point.y-center.y,2));
        if (minLength > length){
            closestView = blackCell;
            minLength = length;
        }
    }
    if (closestView.isWithChess){
//        [UIView animateWithDuration:0.3f animations:^{
//            self.dragableView.center = self.previousCell.center;
//        }];
        NSLog(@"Куда прёшь!");
    } else {
        self.dragableView.center = closestView.center;
        [closestView setIsWithChess:YES];
        [self.previousCell setIsWithChess:NO];
        
    }
    
    self.dragableView = nil;
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.dragableView = nil;
}

-(void)getClosestPoint {
}

-(void) setUpSide{
    CGFloat maxX = CGRectGetMaxX(super.view.frame);
    CGFloat maxY = CGRectGetMaxY(super.view.frame);
    CGFloat minSide = maxX > maxY ? maxY : maxX;
    self.side = minSide / 8;
}

-(void) initBoard{
    self.board = [[AZBoard alloc] initWithFrame:CGRectMake(0, 0, self.side*8, self.side*8)];
    self.board.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    self.board.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview: self.board];
}

-(void) addCells{
    self.blackCells = [NSMutableArray new];
    for (int x = 0; x < kboardSize; x++){
        for (int y = 0; y < kboardSize; y++){
            AZCell *cell = [[AZCell alloc] initWithFrame:CGRectMake(x*self.side, y*self.side, self.side, self.side)];
            [self.board addSubview:cell];
            if ((x+y)%2){
                cell.backgroundColor = [UIColor blackColor];
                [self.blackCells addObject:cell];
                if (y < 3 || y > 4){
                    cell.isWithChess = YES;
                    AZChess *chess = [[AZChess alloc] initWithFrame:CGRectMake(0,0,self.side/2,self.side/2)];
                    chess.backgroundColor = [UIColor redColor];
                    chess.center = cell.center;
                    [self.board addSubview:chess];
                }
            }
        }
    }
}

@end
