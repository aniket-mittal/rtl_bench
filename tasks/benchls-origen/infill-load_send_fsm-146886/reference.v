module origen_146886 (
    input wire clk,
    input wire en,
    input wire arst,
    input wire srst,
    input wire ld,
    input wire [7:0] d,
    output reg vd,
    output reg lz,
    output reg [7:0] z
);

    // State definition
    localparam IDLE = 2'b00;
    localparam LOAD = 2'b01;
    localparam WAIT = 2'b10;
    localparam SEND = 2'b11;

    reg [1:0] state, next_state;
    reg [7:0] buffer;
    reg buffer_full;

    // State register
    always @(posedge clk or posedge arst) begin
        if (arst) begin
            state <= IDLE;
        end else if (srst) begin
            state <= IDLE;
        end else if (en) begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (ld) next_state = LOAD;
            end
            LOAD: begin
                if (buffer_full) next_state = WAIT;
                else next_state = SEND;
            end
            WAIT: begin
                if (!buffer_full) next_state = SEND;
            end
            SEND: begin
                if (ld) next_state = LOAD;
                else next_state = IDLE;
            end
        endcase
    end

    // Output logic
    always @(posedge clk or posedge arst) begin
        if (arst) begin
            buffer <= 8'b0;
            buffer_full <= 1'b0;
            vd <= 1'b0;
            lz <= 1'b0;
            z <= 8'b0;
        end else if (srst) begin
            buffer <= 8'b0;
            buffer_full <= 1'b0;
            vd <= 1'b0;
            lz <= 1'b0;
            z <= 8'b0;
        end else if (en) begin
            case (state)
                IDLE: begin
                    vd <= 1'b0;
                    lz <= buffer_full;
                end
                LOAD: begin
                    buffer <= d;
                    buffer_full <= 1'b1;
                    vd <= 1'b0;
                    lz <= 1'b1;
                end
                WAIT: begin
                    vd <= 1'b0;
                    lz <= buffer_full;
                end
                SEND: begin
                    if (!buffer_full) begin
                        z <= buffer;
                        vd <= 1'b1;
                        buffer_full <= 1'b0;
                        lz <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule