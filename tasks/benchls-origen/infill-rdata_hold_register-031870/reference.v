module origen_031870 (
    input wire clk,
    input wire resetn,
    input wire wren,
    input wire [31:0] data,
    output reg [31:0] q
);
    reg [31:0] rdata;

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            rdata <= 32'b0;
            q <= 32'b0;
        end else if (wren) begin
            rdata <= data;
            q <= data;
        end else begin
            q <= rdata;
        end
    end
endmodule

module MapRam (
    input wire clk,
    input wire resetn,
    input wire enable,
    input wire [2:0] read_req,
    input wire [1:0] write_req,
    input wire [31:0] address0,
    input wire [31:0] address1,
    input wire [31:0] address2,
    input wire [31:0] write_data,
    output reg [2:0] read_data_done,
    output reg [1:0] write_data_done,
    output wire [31:0] read_data
);
    localparam START = 3'd0, FUNC_SEL = 3'd1, READ0 = 3'd2, READ1 = 3'd3, READ2 = 3'd4, WRITE1 = 3'd5, WRITE2 = 3'd6;
    
    reg [2:0] state, next_state;
    reg [31:0] mem_address;
    reg mem_wren;
    reg [31:0] mem_write_data;
    
    initialize_1 memory (
        .clk(clk),
        .resetn(resetn),
        .wren(mem_wren),
        .data(mem_write_data),
        .q(read_data)
    );
    
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            state <= START;
        end else begin
            state <= next_state;
        end
    end
    
    always @(*) begin
        next_state = state;
        mem_address = 32'b0;
        mem_wren = 1'b0;
        mem_write_data = 32'b0;
        read_data_done = 3'b0;
        write_data_done = 2'b0;
        
        case (state)
            START: begin
                if (enable) next_state = FUNC_SEL;
            end
            
            FUNC_SEL: begin
                if (read_req[0]) begin
                    next_state = READ0;
                    mem_address = address0;
                end else if (write_req[0]) begin
                    next_state = WRITE1;
                    mem_address = address1;
                    mem_wren = 1'b1;
                    mem_write_data = write_data;
                end else if (write_req[1]) begin
                    next_state = WRITE2;
                    mem_address = address2;
                    mem_wren = 1'b1;
                    mem_write_data = write_data;
                end else if (read_req[1]) begin
                    next_state = READ1;
                    mem_address = address1;
                end else if (read_req[2]) begin
                    next_state = READ2;
                    mem_address = address2;
                end else begin
                    next_state = START;
                end
            end
            
            READ0: begin
                read_data_done[0] = 1'b1;
                next_state = START;
            end
            
            READ1: begin
                read_data_done[1] = 1'b1;
                next_state = START;
            end
            
            READ2: begin
                read_data_done[2] = 1'b1;
                next_state = START;
            end
            
            WRITE1: begin
                write_data_done[0] = 1'b1;
                next_state = START;
            end
            
            WRITE2: begin
                write_data_done[1] = 1'b1;
                next_state = START;
            end
            
            default: next_state = START;
        endcase
    end
endmodule