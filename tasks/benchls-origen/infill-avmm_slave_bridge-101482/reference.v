module origen_101482 #(
    parameter AVMM_ADDR_WIDTH = 32,
    parameter RDL_ADDR_WIDTH = 16
) (
    input  wire                         avmm_clk,
    input  wire                         avmm_rst_n,
    input  wire                         i_avmm_write,
    input  wire                         i_avmm_read,
    input  wire [AVMM_ADDR_WIDTH-1:0]   i_avmm_addr,
    input  wire [31:0]                  i_avmm_wdata,
    input  wire [3:0]                   i_avmm_byte_en,
    input  wire [31:0]                  readdata,
    
    output reg  [31:0]                  o_avmm_rdata,
    output reg                          o_avmm_rdatavalid,
    output reg                          o_avmm_waitrequest,
    output wire                         clk,
    output wire                         reset,
    output reg  [31:0]                  writedata,
    output reg                          read,
    output reg                          write,
    output reg  [3:0]                   byteenable,
    output reg  [RDL_ADDR_WIDTH-1:0]    address
);

    localparam [31:0] RDATA_OUT_OF_RANGE_ADDR = 32'hDEADBEEF;
    
    localparam [1:0] SM_IDLE = 2'b00,
                     SM_WRITE = 2'b01,
                     SM_READ = 2'b10,
                     SM_CPL = 2'b11;
    
    reg [1:0] state, next_state;
    reg addr_out_of_range;
    
    assign clk = avmm_clk;
    assign reset = ~avmm_rst_n;
    
    always @(posedge avmm_clk or negedge avmm_rst_n) begin
        if (~avmm_rst_n)
            state <= SM_IDLE;
        else
            state <= next_state;
    end
    
    always @(*) begin
        next_state = state;
        case (state)
            SM_IDLE: begin
                if (i_avmm_write)
                    next_state = SM_WRITE;
                else if (i_avmm_read)
                    next_state = SM_READ;
            end
            SM_WRITE: next_state = SM_IDLE;
            SM_READ: next_state = SM_CPL;
            SM_CPL: next_state = SM_IDLE;
        endcase
    end
    
    always @(posedge avmm_clk or negedge avmm_rst_n) begin
        if (~avmm_rst_n) begin
            o_avmm_waitrequest <= 1'b0;
            o_avmm_rdatavalid <= 1'b0;
            o_avmm_rdata <= 32'b0;
            read <= 1'b0;
            write <= 1'b0;
            writedata <= 32'b0;
            byteenable <= 4'b0;
            address <= {RDL_ADDR_WIDTH{1'b0}};
            addr_out_of_range <= 1'b0;
        end else begin
            case (state)
                SM_IDLE: begin
                    o_avmm_waitrequest <= 1'b0;
                    o_avmm_rdatavalid <= 1'b0;
                    read <= 1'b0;
                    write <= 1'b0;
                    addr_out_of_range <= (AVMM_ADDR_WIDTH > RDL_ADDR_WIDTH) && (i_avmm_addr[AVMM_ADDR_WIDTH-1:RDL_ADDR_WIDTH] != 0);
                    if (i_avmm_write || i_avmm_read) begin
                        o_avmm_waitrequest <= 1'b1;
                        address <= i_avmm_addr[RDL_ADDR_WIDTH-1:0];
                    end
                end
                SM_WRITE: begin
                    if (~addr_out_of_range) begin
                        write <= 1'b1;
                        writedata <= i_avmm_wdata;
                        byteenable <= i_avmm_byte_en;
                    end
                    o_avmm_waitrequest <= 1'b0;
                end
                SM_READ: begin
                    if (~addr_out_of_range) begin
                        read <= 1'b1;
                    end
                end
                SM_CPL: begin
                    o_avmm_rdatavalid <= 1'b1;
                    o_avmm_rdata <= addr_out_of_range ? RDATA_OUT_OF_RANGE_ADDR : readdata;
                    read <= 1'b0;
                end
            endcase
        end
    end

endmodule