module origen_059964 #(
    parameter WIDTH = 32,
    parameter DEPTH = 256,
    parameter TRIGAT = 64,
    parameter MODE = "NORMAL"
) (
    input wire clk,
    input wire resetn,
    input wire enable,
    input wire trigger,
    input wire [WIDTH-1:0] data,
    input wire dump_en,
    input wire dump_ready,
    output reg triggered,
    output reg dump_valid,
    output reg [7:0] dump_data
);

    localparam ADDR_WIDTH = $clog2(DEPTH);
    localparam BYTES_PER_WORD = (WIDTH + 7) / 8;
    localparam BYTE_COUNT_WIDTH = $clog2(BYTES_PER_WORD);

    reg [WIDTH-1:0] memory [0:DEPTH-1];
    reg [ADDR_WIDTH-1:0] write_ptr, read_ptr, trigger_ptr;
    reg [ADDR_WIDTH:0] sample_count;
    reg [BYTE_COUNT_WIDTH-1:0] byte_count;
    reg [1:0] state;

    localparam RUNNING = 2'b00, TRIGGERED = 2'b01, WAIT_DUMP = 2'b10, DUMPING = 2'b11;

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            state <= RUNNING;
            triggered <= 0;
            dump_valid <= 0;
            write_ptr <= 0;
            read_ptr <= 0;
            trigger_ptr <= 0;
            sample_count <= 0;
            byte_count <= 0;
        end else begin
            case (state)
                RUNNING: begin
                    if (enable) begin
                        memory[write_ptr] <= data;
                        write_ptr <= write_ptr + 1;
                        if (MODE != "FREE_RUNNING" && trigger) begin
                            triggered <= 1;
                            trigger_ptr <= write_ptr;
                            state <= TRIGGERED;
                        end
                    end
                end

                TRIGGERED: begin
                    if (enable) begin
                        memory[write_ptr] <= data;
                        write_ptr <= write_ptr + 1;
                        sample_count <= sample_count + 1;
                        if (sample_count == DEPTH - TRIGAT - 1) begin
                            state <= WAIT_DUMP;
                        end
                    end
                    if (MODE == "LAST_TRIGGER" && trigger) begin
                        sample_count <= 0;
                        trigger_ptr <= write_ptr;
                    end
                end

                WAIT_DUMP: begin
                    if (dump_en) begin
                        state <= DUMPING;
                        read_ptr <= trigger_ptr;
                        byte_count <= 0;
                    end
                end

                DUMPING: begin
                    if (dump_ready) begin
                        dump_valid <= 1;
                        dump_data <= memory[read_ptr][byte_count*8 +: 8];
                        if (byte_count == BYTES_PER_WORD - 1) begin
                            byte_count <= 0;
                            read_ptr <= read_ptr + 1;
                            if (read_ptr == write_ptr - 1) begin
                                state <= RUNNING;
                                triggered <= 0;
                            end
                        end else begin
                            byte_count <= byte_count + 1;
                        end
                    end else begin
                        dump_valid <= 0;
                    end
                end
            endcase
        end
    end

endmodule