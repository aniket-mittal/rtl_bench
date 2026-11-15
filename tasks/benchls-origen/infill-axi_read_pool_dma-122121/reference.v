module origen_122121 #(
    parameter channel_size = 64,
    parameter repeat_time = 4,
    parameter width = 8
) (
    input wire clk,
    input wire rst_n,
    input wire [27:0] rd_addr,
    input wire addr_ena,
    input wire arready,
    input wire rvalid,
    input wire rlast,
    input wire [3:0] rid,
    input wire [127:0] rdata,
    output reg [channel_size*width-1:0] pool_in,
    output reg in_valid,
    output reg arvalid,
    output reg [3:0] aruser_id,
    output reg [7:0] arlen,
    output reg [1:0] aruser_ap,
    output reg [27:0] araddr
);

    localparam IDLE = 2'b00;
    localparam ADDR_READ = 2'b01;
    localparam WAIT_DATA = 2'b10;
    localparam READ_DATA = 2'b11;

    reg [1:0] state, next_state;
    reg [27:0] addr_reg;
    reg [2:0] last_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            addr_reg <= 28'b0;
            last_cnt <= 3'b0;
            pool_in <= {(channel_size*width){1'b0}};
            in_valid <= 1'b0;
            arvalid <= 1'b0;
            aruser_id <= 4'b0;
            arlen <= 8'b0;
            aruser_ap <= 2'b0;
            araddr <= 28'b0;
        end else begin
            state <= next_state;
            
            case (state)
                IDLE: begin
                    if (addr_ena) begin
                        addr_reg <= rd_addr;
                    end
                end
                
                ADDR_READ: begin
                    if (arready) begin
                        arvalid <= 1'b0;
                    end
                end
                
                READ_DATA: begin
                    if (rvalid) begin
                        pool_in <= {rdata, pool_in[channel_size*width-1:128]};
                        if (rlast) begin
                            addr_reg <= addr_reg + 28'h10;
                            last_cnt <= (last_cnt == repeat_time - 1) ? 3'b0 : last_cnt + 1'b1;
                            in_valid <= (last_cnt == repeat_time - 1);
                        end
                    end
                end
            endcase
        end
    end

    always @(*) begin
        next_state = state;
        
        case (state)
            IDLE: begin
                if (addr_ena) next_state = ADDR_READ;
            end
            
            ADDR_READ: begin
                if (arready) next_state = WAIT_DATA;
            end
            
            WAIT_DATA: begin
                if (rvalid) next_state = READ_DATA;
            end
            
            READ_DATA: begin
                if (rlast) next_state = IDLE;
            end
        endcase
    end

    always @(*) begin
        arvalid = (state == ADDR_READ);
        aruser_id = 4'b0001;
        arlen = 8'd3;
        aruser_ap = 2'b01;
        araddr = addr_reg;
    end

endmodule