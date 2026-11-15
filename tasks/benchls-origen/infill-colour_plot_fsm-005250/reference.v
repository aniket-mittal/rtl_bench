module origen_005250(
    input clock,
    input resetn,
    input load,
    input go,
    input [2:0] colour_in,
    input [6:0] location,
    output [7:0] x_out,
    output [6:0] y_out,
    output [2:0] colour_out
);

    wire controlX, controlY, controlC, writeEn, enable_x;

    control C0(
        .clock(clock),
        .resetn(resetn),
        .load(load),
        .go(go),
        .controlX(controlX),
        .controlY(controlY),
        .controlC(controlC),
        .writeEn(writeEn),
        .enable_x(enable_x)
    );

    datapath D0(
        .clock(clock),
        .resetn(resetn),
        .controlX(controlX),
        .controlY(controlY),
        .controlC(controlC),
        .enable_x(enable_x),
        .colour_in(colour_in),
        .location(location),
        .x_out(x_out),
        .y_out(y_out),
        .colour_out(colour_out)
    );

endmodule

module control(
    input clock,
    input resetn,
    input load,
    input go,
    output reg controlX, controlY, controlC, writeEn, enable_x
);

    reg [2:0] current_state, next_state;

    localparam LOAD_X      = 3'd0,
               LOAD_X_WAIT = 3'd1,
               LOAD_Y      = 3'd2,
               LOAD_Y_WAIT = 3'd3,
               PLOT        = 3'd4;

    always @(*)
    begin: state_table
        case (current_state)
            LOAD_X:      next_state = load ? LOAD_X_WAIT : LOAD_X;
            LOAD_X_WAIT: next_state = load ? LOAD_X_WAIT : LOAD_Y;
            LOAD_Y:      next_state = go ? LOAD_Y_WAIT : LOAD_Y;
            LOAD_Y_WAIT: next_state = go ? LOAD_Y_WAIT : PLOT;
            PLOT:        next_state = (enable_x == 1'b0) ? LOAD_X : PLOT;
            default:     next_state = LOAD_X;
        endcase
    end

    always @(*)
    begin: enable_signals
        controlX = 1'b0;
        controlY = 1'b0;
        controlC = 1'b0;
        writeEn = 1'b0;
        enable_x = 1'b0;

        case (current_state)
            LOAD_X: controlX = 1'b1;
            LOAD_Y: begin
                controlY = 1'b1;
                controlC = 1'b1;
            end
            PLOT: begin
                writeEn = 1'b1;
                enable_x = 1'b1;
            end
        endcase
    end

    always @(posedge clock)
    begin: state_FFs
        if(!resetn)
            current_state <= LOAD_X;
        else
            current_state <= next_state;
    end

endmodule

module datapath(
    input clock,
    input resetn,
    input controlX, controlY, controlC, enable_x,
    input [2:0] colour_in,
    input [6:0] location,
    output reg [7:0] x_out,
    output reg [6:0] y_out,
    output reg [2:0] colour_out
);

    reg [7:0] x;
    reg [6:0] y;
    reg [2:0] colour;
    reg [3:0] i_x, i_y;

    always @(posedge clock) begin
        if (!resetn) begin
            x <= 8'd0;
            y <= 7'd0;
            colour <= 3'd0;
            i_x <= 4'd0;
            i_y <= 4'd0;
        end
        else begin
            if (controlX)
                x <= {1'b0, location};
            if (controlY)
                y <= location;
            if (controlC)
                colour <= colour_in;
            if (enable_x) begin
                if (i_x == 4'b1111) begin
                    i_x <= 4'd0;
                    i_y <= i_y + 1'b1;
                end
                else
                    i_x <= i_x + 1'b1;
            end
        end
    end

    always @(*) begin
        x_out = x + i_x;
        y_out = y + i_y;
        colour_out = colour;
    end

endmodule