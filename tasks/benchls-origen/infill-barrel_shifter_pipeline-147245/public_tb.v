// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_147245 dut (
    .clk(clk),
    .rst(in_vec[11:11]),
    .data_in(in_vec[10:3]),
    .shift_amount(in_vec[2:1]),
    .select(in_vec[0:0]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hd80;
    stim[1] = 12'h928;
    stim[2] = 12'h318;
    stim[3] = 12'hded;
    stim[4] = 12'h0ad;
    stim[5] = 12'h2c1;
    stim[6] = 12'h254;
    stim[7] = 12'h45e;
    stim[8] = 12'h6d5;
    stim[9] = 12'h398;
    stim[10] = 12'h7f6;
    stim[11] = 12'h797;
    stim[12] = 12'h20c;
    stim[13] = 12'h5c1;
    stim[14] = 12'h59a;
    stim[15] = 12'h642;
    stim[16] = 12'h5b1;
    stim[17] = 12'h372;
    stim[18] = 12'h13e;
    stim[19] = 12'h7a5;
    stim[20] = 12'h41b;
    stim[21] = 12'h44d;
    stim[22] = 12'h774;
    stim[23] = 12'h4a9;
    stim[24] = 12'hc69;
    stim[25] = 12'h64c;
    stim[26] = 12'h6e2;
    stim[27] = 12'h791;
    stim[28] = 12'h733;
    stim[29] = 12'h261;
    stim[30] = 12'h3dc;
    stim[31] = 12'h61c;
    stim[32] = 12'h686;
    stim[33] = 12'h534;
    stim[34] = 12'h51a;
    stim[35] = 12'h508;
    stim[36] = 12'h6c6;
    stim[37] = 12'h048;
    stim[38] = 12'h06d;
    stim[39] = 12'h117;
    stim[40] = 12'h499;
    stim[41] = 12'h752;
    stim[42] = 12'h6bc;
    stim[43] = 12'h416;
    stim[44] = 12'h29d;
    stim[45] = 12'h306;
    stim[46] = 12'h5c2;
    stim[47] = 12'h48e;
    stim[48] = 12'h39a;
    stim[49] = 12'h620;
    stim[50] = 12'h378;
    stim[51] = 12'h0a8;
    stim[52] = 12'h130;
    stim[53] = 12'h942;
    stim[54] = 12'h769;
    stim[55] = 12'h504;
    stim[56] = 12'h12b;
    stim[57] = 12'h69f;
    stim[58] = 12'h312;
    stim[59] = 12'h4b5;
    stim[60] = 12'h1a2;
    stim[61] = 12'h303;
    stim[62] = 12'h42e;
    stim[63] = 12'h59a;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h54;
      expv[7] = 8'h4d;
      expv[8] = 8'h4a;
      expv[9] = 8'h12;
      expv[10] = 8'he3;
      expv[11] = 8'ha9;
      expv[12] = 8'h83;
      expv[13] = 8'h6e;
      expv[14] = 8'he2;
      expv[15] = 8'hf9;
      expv[16] = 8'he1;
      expv[17] = 8'h23;
      expv[18] = 8'h7e;
      expv[19] = 8'h81;
      expv[20] = 8'h56;
      expv[21] = 8'hf7;
      expv[22] = 8'hb5;
      expv[23] = 8'ha1;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h24;
      expv[28] = 8'h71;
      expv[29] = 8'h2e;
      expv[30] = 8'h81;
      expv[31] = 8'haa;
      expv[32] = 8'h52;
      expv[33] = 8'h77;
      expv[34] = 8'h43;
      expv[35] = 8'h48;
      expv[36] = 8'he0;
      expv[37] = 8'h02;
      expv[38] = 8'h61;
      expv[39] = 8'hd1;
      expv[40] = 8'h3d;
      expv[41] = 8'h09;
      expv[42] = 8'hb1;
      expv[43] = 8'he6;
      expv[44] = 8'hb6;
      expv[45] = 8'hc7;
      expv[46] = 8'hce;
      expv[47] = 8'h5f;
      expv[48] = 8'h10;
      expv[49] = 8'h30;
      expv[50] = 8'h77;
      expv[51] = 8'hb7;
      expv[52] = 8'hab;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'hed;
      expv[57] = 8'hc5;
      expv[58] = 8'hea;
      expv[59] = 8'h3f;
      expv[60] = 8'he2;
      expv[61] = 8'h3a;
      expv[62] = 8'h8c;
      expv[63] = 8'hf4;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
