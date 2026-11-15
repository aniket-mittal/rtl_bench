module origen_055212 (
    // AHB interface
    input wire hclk,
    input wire hreset_n,
    input wire hsel,
    input wire [2:0] hsize,
    input wire [1:0] htrans,
    input wire hwrite,
    input wire [31:0] haddr,
    input wire [63:0] hwdata,
    output reg [63:0] hrdata,
    output reg [1:0] hresp,
    output reg hready,
    
    // FSB interface
    output wire clk,
    output wire rst_n,
    output reg aen,
    output reg [1:0] size,
    output reg wr_n,
    output reg [15:0] AD_out,
    input wire rdy_n,
    input wire error_n,
    input wire irq_n,
    input wire [15:0] AD_in,
    
    // Interrupt output
    output wire FSB_irq
);

    // State machine states
    localparam [2:0] stb = 3'b000,
                     read_addr_frame0 = 3'b001,
                     read_addr_frame1 = 3'b010,
                     write_addr_frame0 = 3'b011,
                     write_addr_frame1 = 3'b100,
                     nop_frame = 3'b101,
                     read_frame = 3'b110,
                     write_frame = 3'b111;

    reg [2:0] state, next_state;
    reg [31:0] ADDR_reg;
    reg [15:0] DATA_reg;
    reg [15:0] output_reg;
    reg hi_z;
    reg word_size;

    // Clock and reset assignments
    assign clk = hclk;
    assign rst_n = hreset_n;
    assign FSB_irq = ~irq_n;

    // State machine
    always @(posedge hclk or negedge hreset_n) begin
        if (~hreset_n)
            state <= stb;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            stb: begin
                if (hsel && htrans != 2'b00 && ~hwrite)
                    next_state = read_addr_frame0;
                else if (hsel && htrans != 2'b00 && hwrite)
                    next_state = write_addr_frame0;
            end
            read_addr_frame0: next_state = read_addr_frame1;
            read_addr_frame1: next_state = nop_frame;
            write_addr_frame0: next_state = write_addr_frame1;
            write_addr_frame1: next_state = write_frame;
            nop_frame: next_state = read_frame;
            read_frame: begin
                if (~rdy_n)
                    next_state = word_size ? read_frame : stb;
            end
            write_frame: begin
                if (~rdy_n)
                    next_state = word_size ? write_frame : stb;
            end
        endcase
    end

    // Output logic
    always @(posedge hclk or negedge hreset_n) begin
        if (~hreset_n) begin
            aen <= 1'b0;
            size <= 2'b00;
            wr_n <= 1'b1;
            AD_out <= 16'h0000;
            ADDR_reg <= 32'h00000000;
            DATA_reg <= 16'h0000;
            output_reg <= 16'h0000;
            hi_z <= 1'b1;
            word_size <= 1'b0;
            hready <= 1'b1;
            hresp <= 2'b00;
            hrdata <= 64'h0000000000000000;
        end else begin
            case (state)
                stb: begin
                    aen <= 1'b0;
                    wr_n <= 1'b1;
                    hi_z <= 1'b1;
                    hready <= 1'b1;
                    if (hsel && htrans != 2'b00) begin
                        ADDR_reg <= haddr;
                        word_size <= (hsize == 3'b010);
                        size <= hsize[1:0];
                    end
                end
                read_addr_frame0, write_addr_frame0: begin
                    aen <= 1'b1;
                    AD_out <= ADDR_reg[31:16];
                    hi_z <= 1'b0;
                    hready <= 1'b0;
                end
                read_addr_frame1, write_addr_frame1: begin
                    AD_out <= ADDR_reg[15:0];
                end
                nop_frame: begin
                    aen <= 1'b0;
                    hi_z <= 1'b1;
                end
                read_frame: begin
                    wr_n <= 1'b1;
                    hi_z <= 1'b1;
                    if (~rdy_n) begin
                        output_reg <= AD_in;
                        if (~word_size) begin
                            hrdata <= {48'h000000000000, AD_in};
                            hready <= 1'b1;
                        end
                    end
                    if (error_n == 1'b0) begin
                        hresp <= 2'b01;
                        hready <= 1'b1;
                    end
                end
                write_frame: begin
                    aen <= 1'b1;
                    wr_n <= 1'b0;
                    hi_z <= 1'b0;
                    if (word_size)
                        AD_out <= hwdata[63:48];
                    else
                        AD_out <= hwdata[15:0];
                    if (~rdy_n) begin
                        if (~word_size)
                            hready <= 1'b1;
                    end
                    if (error_n == 1'b0) begin
                        hresp <= 2'b01;
                        hready <= 1'b1;
                    end
                end
            endcase
        end
    end

endmodule