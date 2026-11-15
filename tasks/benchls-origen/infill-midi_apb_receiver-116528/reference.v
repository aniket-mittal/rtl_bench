module origen_116528 (
    input wire clk,
    input wire n_rst,
    input wire PSEL,
    input wire PENABLE,
    input wire PWRITE,
    input wire [31:0] PWDATA,
    output reg [31:0] MIDI_Data,
    output reg data_ready
);

    // State encoding
    localparam IDLE = 3'd0,
               WAIT_WRITE = 3'd1,
               WAIT_ENABLE = 3'd2,
               RECEIVE = 3'd3,
               OUTPUT = 3'd4;

    reg [2:0] current_state, next_state;
    reg [31:0] midiout;

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE:         next_state = PSEL ? WAIT_WRITE : IDLE;
            WAIT_WRITE:   next_state = PWRITE ? WAIT_ENABLE : IDLE;
            WAIT_ENABLE:  next_state = PENABLE ? RECEIVE : WAIT_ENABLE;
            RECEIVE:      next_state = OUTPUT;
            OUTPUT:       next_state = IDLE;
            default:      next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        data_ready = (current_state == OUTPUT);
        MIDI_Data = midiout;
    end

    // State register
    always @(posedge clk or negedge n_rst) begin
        if (!n_rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Data capture
    always @(posedge clk or negedge n_rst) begin
        if (!n_rst)
            midiout <= 32'b0;
        else if (current_state == RECEIVE)
            midiout <= PWDATA;
    end

endmodule