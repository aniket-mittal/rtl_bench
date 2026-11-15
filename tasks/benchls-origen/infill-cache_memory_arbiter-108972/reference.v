module origen_108972 (
    input wire clk,
    input wire rst,
    
    // Instruction memory interface
    input wire inst_mem_read,
    input wire [31:0] inst_mem_address,
    output reg [31:0] inst_mem_rdata,
    output reg inst_mem_resp,
    
    // Data memory interface
    input wire data_mem_read,
    input wire data_mem_write,
    input wire [31:0] data_mem_address,
    input wire [31:0] data_mem_wdata,
    output reg [31:0] data_mem_rdata,
    output reg data_mem_resp,
    
    // Memory interface
    output reg mem_read,
    output reg mem_write,
    output reg [31:0] mem_address,
    output reg [31:0] mem_wdata,
    input wire [31:0] mem_rdata,
    input wire mem_resp,
    
    // State indicators
    output reg [1:0] state
);

    // State encoding
    localparam IDLE = 2'b00;
    localparam INST_C = 2'b01;
    localparam DATA_C = 2'b10;

    reg [1:0] next_state;

    // State transition and output logic
    always @(*) begin
        // Default values
        next_state = state;
        mem_read = 1'b0;
        mem_write = 1'b0;
        mem_address = 32'b0;
        mem_wdata = 32'b0;
        inst_mem_resp = 1'b0;
        data_mem_resp = 1'b0;

        case (state)
            IDLE: begin
                if (inst_mem_read) begin
                    next_state = INST_C;
                end else if (data_mem_read || data_mem_write) begin
                    next_state = DATA_C;
                end
            end

            INST_C: begin
                mem_read = 1'b1;
                mem_address = inst_mem_address;
                inst_mem_resp = mem_resp;

                if (mem_resp) begin
                    if (data_mem_read || data_mem_write) begin
                        next_state = DATA_C;
                    end else if (!inst_mem_read) begin
                        next_state = IDLE;
                    end
                end
            end

            DATA_C: begin
                mem_read = data_mem_read;
                mem_write = data_mem_write;
                mem_address = data_mem_address;
                mem_wdata = data_mem_wdata;
                data_mem_resp = mem_resp;

                if (mem_resp) begin
                    if (inst_mem_read) begin
                        next_state = INST_C;
                    end else if (!data_mem_read && !data_mem_write) begin
                        next_state = IDLE;
                    end
                end
            end

            default: next_state = IDLE;
        endcase
    end

    // State update
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Memory read data assignment
    always @(*) begin
        inst_mem_rdata = mem_rdata;
        data_mem_rdata = mem_rdata;
    end

endmodule