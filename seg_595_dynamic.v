module seg_595_dynamic
(
    input   wire        sys_clk     ,
    input   wire        sys_rst_n   ,
    input   wire [19:0] data        ,  
    input   wire [5:0]  point       ,
    input   wire        sign        ,
    input   wire        seg_en      ,
    
    output  wire        ds          ,
    output  wire        shcp        ,
    output  wire        stcp        ,
    output  wire        oe          
);

wire    [5:0]   sel ;
wire    [7:0]   seg ;


seg_dynamic seg_dynamic_inst
(
   .sys_clk   (sys_clk  ),
   .sys_rst_n (sys_rst_n),
   .data      (data     ),  
   .point     (point    ),
   .sign      (sign     ),
   .seg_en    (seg_en   ),

   .sel       (sel      ),//段选
   .seg       (seg      ) //位选
);

hc595_ctrl  hc595_ctrl
(
   .sys_clk   ( sys_clk   ) ,
   .sys_rst_n ( sys_rst_n ) ,
   .sel       ( sel       ) ,
   .seg       ( seg       ) ,

   .ds        ( ds        ) ,
   .shcp      ( shcp      ) ,
   .stcp      ( stcp      ) ,
   .oe        ( oe        ) 

);

endmodule