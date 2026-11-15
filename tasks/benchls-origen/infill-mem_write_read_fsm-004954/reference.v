module origen_004954 #(
    parameter ADDR_WIDTH = 32,
    parameter INITIAL_ADDR = 32'h0000_0000,
    parameter ADDRESS_OFFSET_ONE = 32'h0000_0001
) (
    input wire clk,
    input wire layer_reset,
    input wire [ADDR_WIDTH-1:0] read_address_i,
    input wire [ADDR_WIDTH-1:0] write_address_i,
    input wire stage_finish_i,
    output reg mem_rd_en_o,
    output reg mem_wr_en_o,
    output reg [ADDR_WIDTH-1:0] address_o
);

    // State encoding
    localparam [2:0] IDLE = 3'b000,
                     WRITE_PHASE_0 = 3'b001,
                     WRITE_PHASE_1 = 3'b010,
                     READ_PHASE_0 = 3'b011,
                     READ_PHASE_1 = 3'b100;

    reg [2:0] current_state, next_state;
    reg [ADDR_WIDTH-1:0] read_address, write_address;

    // State transition logic
    always @(posedge clk or posedge layer_reset) begin
        if (layer_reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE:           next_state = stage_finish_i ? WRITE_PHASE_0 : IDLE;
            WRITE_PHASE_0:  next_state = WRITE_PHASE_1;
            WRITE_PHASE_1:  next_state = READ_PHASE_0;
            READ_PHASE_0:   next_state = READ_PHASE_1;
            READ_PHASE_1:   next_state = IDLE;
            default:        next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk or posedge layer_reset) begin
        if (layer_reset) begin
            mem_rd_en_o <= 1'b0;
            mem_wr_en_o <= 1'b0;
            address_o <= INITIAL_ADDR;
            read_address <= read_address_i;
            write_address <= write_address_i;
        end else begin
            case (current_state)
                IDLE: begin
                    mem_rd_en_o <= 1'b0;
                    mem_wr_en_o <= 1'b0;
                    address_o <= INITIAL_ADDR;
                end
                WRITE_PHASE_0: begin
                    mem_wr_en_o <= 1'b1;
                    mem_rd_en_o <= 1'b0;
                    address_o <= write_address;
                end
                WRITE_PHASE_1: begin
                    mem_wr_en_o <= 1'b1;
                    mem_rd_en_o <= 1'b0;
                    address_o <= write_address;
                    write_address <= write_address + ADDRESS_OFFSET_ONE;
                end
                READ_PHASE_0: begin
                    mem_rd_en_o <= 1'b1;
                    mem_wr_en_o <= 1'b0;
                    address_o <= read_address;
                end
                READ_PHASE_1: begin
                    mem_rd_en_o <= 1'b1;
                    mem_wr_en_o <= 1'b0;
                    address_o <= read_address;
                    read_address <= read_address + ADDRESS_OFFSET_ONE;
                end
                default: begin
                    mem_rd_en_o <= 1'b0;
                    mem_wr_en_o <= 1'b0;
                    address_o <= INITIAL_ADDR;
                end
            endcase
        end
    end

endmodule