module origen_143113 (
    input wire clk,
    input wire rst_n,
    input wire load_data,
    input wire [511:0] sbox,
    input wire [255:0] key,
    input wire [63:0] data_in,
    output reg [63:0] data_out,
    output reg busy
);

    // Internal signals
    reg [63:0] state;
    reg [4:0] round_counter;
    wire [31:0] round_key;
    wire [63:0] round_out;

    // State machine states
    localparam IDLE = 2'b00;
    localparam DECRYPT = 2'b01;
    localparam DONE = 2'b10;
    reg [1:0] current_state, next_state;

    // Key schedule
    wire [31:0] key_schedule [0:7];
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : key_gen
            assign key_schedule[i] = key[32*i +: 32];
        end
    endgenerate

    // Round key selection
    assign round_key = (round_counter < 24) ? key_schedule[7 - (round_counter % 8)] :
                       (round_counter < 31) ? key_schedule[round_counter - 24] :
                       key_schedule[0];

    // GOST89 round module instantiation
    gost89_round round (
        .sbox(sbox),
        .key(round_key),
        .data_in(state),
        .data_out(round_out)
    );

    // State machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case (current_state)
            IDLE: next_state = load_data ? DECRYPT : IDLE;
            DECRYPT: next_state = (round_counter == 31) ? DONE : DECRYPT;
            DONE: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Decryption process
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= 64'b0;
            round_counter <= 5'b0;
            busy <= 1'b0;
            data_out <= 64'b0;
        end else begin
            case (current_state)
                IDLE: begin
                    if (load_data) begin
                        state <= data_in;
                        round_counter <= 5'b0;
                        busy <= 1'b1;
                    end
                end
                DECRYPT: begin
                    state <= round_out;
                    round_counter <= round_counter + 1;
                end
                DONE: begin
                    data_out <= {state[31:0], state[63:32]};
                    busy <= 1'b0;
                end
            endcase
        end
    end

endmodule

// GOST89 round module (placeholder)
module gost89_round (
    input wire [511:0] sbox,
    input wire [31:0] key,
    input wire [63:0] data_in,
    output wire [63:0] data_out
);
    // Placeholder implementation
    assign data_out = data_in ^ {key, key};
endmodule