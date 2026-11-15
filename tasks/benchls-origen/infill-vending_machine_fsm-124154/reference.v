module origen_124154 (
    input wire clk,
    input wire reset,
    input wire [1:0] product_select,
    input wire [1:0] coin_insert,
    input wire dispense,
    output reg coin_return,
    output reg product_dispensed,
    output reg [4:0] display_value
);

    // Product prices (in nickels)
    parameter PRODUCT1_PRICE = 5'd10;  // 50 cents
    parameter PRODUCT2_PRICE = 5'd14;  // 70 cents
    parameter PRODUCT3_PRICE = 5'd18;  // 90 cents
    parameter PRODUCT4_PRICE = 5'd20;  // 100 cents

    // State definitions
    parameter IDLE = 2'b00;
    parameter COIN_INSERTED = 2'b01;
    parameter DISPENSE_PRODUCT = 2'b10;
    parameter RETURN_CHANGE = 2'b11;

    reg [1:0] current_state, next_state;
    reg [4:0] inserted_amount;
    reg [4:0] selected_price;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        next_state = current_state;
        coin_return = 1'b0;
        product_dispensed = 1'b0;

        case (current_state)
            IDLE: begin
                if (coin_insert != 2'b00)
                    next_state = COIN_INSERTED;
            end

            COIN_INSERTED: begin
                if (inserted_amount >= selected_price && dispense)
                    next_state = DISPENSE_PRODUCT;
                else if (coin_insert != 2'b00)
                    next_state = COIN_INSERTED;
            end

            DISPENSE_PRODUCT: begin
                product_dispensed = 1'b1;
                if (inserted_amount > selected_price)
                    next_state = RETURN_CHANGE;
                else
                    next_state = IDLE;
            end

            RETURN_CHANGE: begin
                coin_return = 1'b1;
                next_state = IDLE;
            end
        endcase
    end

    // Update inserted amount and selected price
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            inserted_amount <= 5'd0;
            selected_price <= PRODUCT1_PRICE;
        end else begin
            case (current_state)
                IDLE: begin
                    inserted_amount <= 5'd0;
                    case (product_select)
                        2'b00: selected_price <= PRODUCT1_PRICE;
                        2'b01: selected_price <= PRODUCT2_PRICE;
                        2'b10: selected_price <= PRODUCT3_PRICE;
                        2'b11: selected_price <= PRODUCT4_PRICE;
                    endcase
                end

                COIN_INSERTED: begin
                    case (coin_insert)
                        2'b00: inserted_amount <= inserted_amount + 5'd1;  // Nickel
                        2'b01: inserted_amount <= inserted_amount + 5'd2;  // Dime
                        2'b10: inserted_amount <= inserted_amount + 5'd5;  // Quarter
                        default: inserted_amount <= inserted_amount;
                    endcase
                end

                DISPENSE_PRODUCT: begin
                    inserted_amount <= (inserted_amount > selected_price) ? (inserted_amount - selected_price) : 5'd0;
                end

                RETURN_CHANGE: begin
                    inserted_amount <= 5'd0;
                end
            endcase
        end
    end

    // Update display value
    always @(posedge clk or posedge reset) begin
        if (reset)
            display_value <= 5'd0;
        else
            display_value <= inserted_amount;
    end

endmodule