module origen_024521 #(
    parameter DATA_WIDTH = 16,
    parameter ADDR_WIDTH = 10,
    parameter DISPLAY_WIDTH = 640,
    parameter DISPLAY_HEIGHT = 480,
    parameter REAL_DISPLAY_WIDTH = 800,
    parameter RGB_WIDTH = 24,
    parameter RGB_COLOR = 24'hFF0000
)(
    input wire clk,
    input wire [DATA_WIDTH-1:0] data,
    input wire [9:0] displayX,
    input wire [9:0] displayY,
    input wire hsync,
    input wire vsync,
    input wire blank,
    input wire [RGB_WIDTH-1:0] previousPixel,
    output reg [RGB_WIDTH-1:0] pixel,
    output reg [ADDR_WIDTH-1:0] addr,
    output reg [9:0] displayXOut,
    output reg [9:0] displayYOut,
    output reg hsyncOut,
    output reg vsyncOut,
    output reg blankOut
);

    reg [9:0] dataScreenLocation;
    reg pixelOn;
    
    always @(posedge clk) begin
        // Calculate data screen location
        dataScreenLocation <= DISPLAY_HEIGHT - (data >> 4);
        
        // Determine if pixel should be lit
        pixelOn <= (displayY <= dataScreenLocation);
        
        // Address counter
        if (addr == REAL_DISPLAY_WIDTH - 2) begin
            addr <= 0;
        end else begin
            addr <= addr + 1;
        end
        
        // Synchronize outputs
        displayXOut <= displayX;
        displayYOut <= displayY;
        hsyncOut <= hsync;
        vsyncOut <= vsync;
        blankOut <= blank;
        
        // Set pixel color
        pixel <= pixelOn ? RGB_COLOR : previousPixel;
    end

endmodule