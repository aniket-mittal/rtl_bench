module origen_140144 #(
    parameter DATA_WIDTH = 32,
    parameter STROBE_WIDTH = DATA_WIDTH / 8,
    parameter USE_KEEP = 0
) (
    input wire rst,
    input wire i_ppfifo_rdy,
    input wire [31:0] i_ppfifo_size,
    input wire [DATA_WIDTH-1:0] i_ppfifo_data,
    input wire i_axi_clk,
    input wire i_axi_ready,

    output reg o_ppfifo_act,
    output reg o_ppfifo_stb,
    output reg o_axi_user,
    output reg [DATA_WIDTH-1:0] o_axi_data,
    output reg o_axi_last,
    output reg o_axi_valid,
    output reg [31:0] o_debug
);

    localparam IDLE = 2'b00;
    localparam TRANSFER = 2'b01;
    localparam LAST = 2'b10;

    reg [1:0] state, next_state;
    reg [31:0] data_count;
    reg [31:0] transfer_count;

    always @(posedge i_axi_clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            data_count <= 32'b0;
            transfer_count <= 32'b0;
            o_ppfifo_act <= 1'b0;
            o_ppfifo_stb <= 1'b0;
            o_axi_user <= 1'b0;
            o_axi_data <= {DATA_WIDTH{1'b0}};
            o_axi_last <= 1'b0;
            o_axi_valid <= 1'b0;
            o_debug <= 32'b0;
        end else begin
            state <= next_state;

            case (state)
                IDLE: begin
                    if (i_ppfifo_rdy) begin
                        o_ppfifo_act <= 1'b1;
                        data_count <= i_ppfifo_size;
                        transfer_count <= 32'b0;
                    end
                end

                TRANSFER: begin
                    if (i_axi_ready && i_ppfifo_rdy) begin
                        o_ppfifo_stb <= 1'b1;
                        o_axi_data <= i_ppfifo_data;
                        o_axi_valid <= 1'b1;
                        transfer_count <= transfer_count + 1;
                        data_count <= data_count - 1;
                    end else begin
                        o_ppfifo_stb <= 1'b0;
                        o_axi_valid <= 1'b0;
                    end
                end

                LAST: begin
                    if (i_axi_ready) begin
                        o_ppfifo_stb <= 1'b0;
                        o_axi_valid <= 1'b0;
                        o_axi_last <= 1'b0;
                        o_ppfifo_act <= 1'b0;
                    end
                end
            endcase
        end
    end

    always @(*) begin
        next_state = state;

        case (state)
            IDLE: begin
                if (i_ppfifo_rdy) next_state = TRANSFER;
            end

            TRANSFER: begin
                if (data_count == 1) next_state = LAST;
            end

            LAST: begin
                if (i_axi_ready) next_state = IDLE;
            end
        endcase
    end

    always @(posedge i_axi_clk) begin
        if (state == TRANSFER && data_count == 1) begin
            o_axi_last <= 1'b1;
        end
    end

    always @(posedge i_axi_clk) begin
        o_debug <= {state, data_count[29:0]};
    end

endmodule