module rtlpp_04943 (
    input  wire [7:0] ui_in,    
    output wire [7:0] uo_out,   
    input  wire [7:0] uio_in,   
    output wire [7:0] uio_out,  
    output wire [7:0] uio_oe,   
    input  wire       ena,      
    input  wire       clk,      
    input  wire       rst_n     
);

    wire SCK, MOSI, EN,  MISO;
    wire [3:0] KeyPlxr, ScreenSel;
    wire [6:0] Out7S;
    reg  [7:0] dIN, dOUT; 

    assign uio_out[7:5] = 3'b000;
    assign uio_oe  = 8'hFF; 
    assign SCK   = clk;      
    assign MOSI  = ui_in[1];
    assign EN    = ui_in[2];
    assign uo_out[7] = MISO;
    assign KeyPlxr      = ui_in[7:4]; 
    assign uo_out[6:0]  = Out7S;
    assign uio_out[3:0] = ScreenSel;
    assign uio_out[4]   = ~EN;

    wire _unused = &{ena, rst_n, uio_in, ui_in[3], ui_in[0], 1'b0};

    integer i;                             

    assign MISO = ~((~dOUT[7]  & ~dOUT[6]  &  KeyPlxr[0]) 
                  | (~dOUT[7]  &  dOUT[6]  &  KeyPlxr[1]) 
                  | ( dOUT[7]  &  dOUT[6]  &  KeyPlxr[3]) 
                  | ( dOUT[7]  & ~dOUT[6]  &  KeyPlxr[2]));

    assign ScreenSel[0] =  dOUT[5]  |  dOUT[4];    
    assign ScreenSel[1] =  dOUT[5]  | ~dOUT[4];    
    assign ScreenSel[2] = ~dOUT[5]  |  dOUT[4];    
    assign ScreenSel[3] = ~dOUT[5]  | ~dOUT[4];    

    assign Out7S[6] = ~EN | (~((~dOUT[3] | (~dOUT[1] & ~dOUT[2])) & (~dOUT[2] | dOUT[1] | dOUT[0]) & (dOUT[3] | dOUT[2] | dOUT[1] | ~dOUT[0])));
    assign Out7S[5] = ~EN | (~((dOUT[3] | ~dOUT[2]) | ((dOUT[1] | ~dOUT[0]) & (~dOUT[1] | dOUT[0]))));
    assign Out7S[4] = ~EN | (~((dOUT[3] | dOUT[2] | ~dOUT[1] | dOUT[0])));
    assign Out7S[3] = ~EN | (~(((~dOUT[3] & ~dOUT[2]) & (dOUT[1] | ~dOUT[0])) | (dOUT[3] & ~dOUT[2] & ~dOUT[1]) | (~dOUT[3] & ((dOUT[1] & ~dOUT[0]) | (dOUT[2] & ~dOUT[1] & dOUT[0])))));
    assign Out7S[2] = ~EN | (~((dOUT[1] & (~dOUT[0] | dOUT[3])) | (dOUT[3] & dOUT[2]) | ((~dOUT[1] & ~dOUT[0]) & (dOUT[3] | ~dOUT[2]))));
    assign Out7S[1] = ~EN | (~(((dOUT[3] | dOUT[2]) | (~dOUT[1] & ~dOUT[0])) & (dOUT[3] | ~dOUT[1] | ~dOUT[0])));
    assign Out7S[0] = ~EN | (~((dOUT[3] | dOUT[2] | dOUT[1]) & (dOUT[3] | ~dOUT[2] | ~dOUT[1] | ~dOUT[0])));

    always @(posedge SCK) begin
        if (EN) begin
            dIN[0] <= MOSI;
            for (i = 0; i < 7; i = i + 1) begin
                dIN[i+1] <= dIN[i];
            end
        end
    end

    always @(negedge EN)begin 
        dOUT <= dIN;
    end

endmodule