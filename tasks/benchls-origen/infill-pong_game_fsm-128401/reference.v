module origen_128401 (
    input wire clock,
    input wire reset,
    input wire start,
    input wire v_sync,
    input wire perdio,
    output reg actualizar_bola,
    output reg actualizar_barra,
    output reg revisar_bordes_bola,
    output reg revisar_bordes_barra,
    output reg revisar_estado,
    output reg reset_bola,
    output reg reset_barra
);

    // State encoding
    localparam [2:0]
        STATE_0 = 3'b000,
        STATE_1 = 3'b001,
        STATE_2 = 3'b010,
        STATE_3 = 3'b011,
        STATE_4 = 3'b100,
        STATE_5 = 3'b101,
        STATE_6 = 3'b110,
        STATE_7 = 3'b111;

    reg [2:0] current_state, next_state;

    // State register
    always @(posedge clock or posedge reset) begin
        if (reset)
            current_state <= STATE_0;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            STATE_0: next_state = start ? STATE_1 : STATE_0;
            STATE_1: next_state = v_sync ? STATE_2 : STATE_1;
            STATE_2: next_state = STATE_3;
            STATE_3: next_state = perdio ? STATE_0 : STATE_4;
            STATE_4: next_state = STATE_5;
            STATE_5: next_state = STATE_6;
            STATE_6: next_state = STATE_7;
            STATE_7: next_state = STATE_1;
            default: next_state = STATE_0;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default output values
        actualizar_bola = 1'b0;
        actualizar_barra = 1'b0;
        revisar_bordes_bola = 1'b0;
        revisar_bordes_barra = 1'b0;
        revisar_estado = 1'b0;
        reset_bola = 1'b0;
        reset_barra = 1'b0;

        case (current_state)
            STATE_0: begin
                reset_bola = 1'b1;
                reset_barra = 1'b1;
            end
            STATE_1: begin
                actualizar_bola = 1'b1;
                actualizar_barra = 1'b1;
            end
            STATE_2: begin
                revisar_estado = 1'b1;
            end
            STATE_3: begin
                // No specific outputs
            end
            STATE_4: begin
                revisar_bordes_bola = 1'b1;
                revisar_bordes_barra = 1'b1;
            end
            STATE_5: begin
                // Wait state, no specific outputs
            end
            STATE_6: begin
                // Deactivate ball and bar state machines
            end
            STATE_7: begin
                // Wait for ball and bar to finish moving
            end
        endcase
    end

endmodule