// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10239 dut (
    .clk(clk),
    .desired_shift_1000(in_vec[66:35]),
    .clk_period_1000(in_vec[34:3]),
    .clk_shifted(in_vec[2:2]),
    .rst(in_vec[1:1]),
    .LOCKED(in_vec[0:0]),
    .fail(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h74dc96ab235d35916;
    stim[1] = 67'h2503504ce92eda02b;
    stim[2] = 67'h52b7204961b101311;
    stim[3] = 67'h10aa64d85ef6546f1;
    stim[4] = 67'h261c1456abec40998;
    stim[5] = 67'h1bdc44cbc8fb14ed4;
    stim[6] = 67'h5c87968fb3d1842ad;
    stim[7] = 67'h7a94fde7466c9d86d;
    stim[8] = 67'h3ea42065db36e7d28;
    stim[9] = 67'h192de0e269b9bf061;
    stim[10] = 67'h30659fd60b71f1ccd;
    stim[11] = 67'h43e2923914ab15f59;
    stim[12] = 67'h07cc73d518e9e1d50;
    stim[13] = 67'h287aeaf57e043bc90;
    stim[14] = 67'h2cd48a3d9bf5673e5;
    stim[15] = 67'h531e95207406fd568;
    stim[16] = 67'h5b38b84c58eed7dd8;
    stim[17] = 67'h11534140f9b7c589c;
    stim[18] = 67'h6c672e26391f37755;
    stim[19] = 67'h43acbc85a09054b54;
    stim[20] = 67'h35fa42eba737b9a84;
    stim[21] = 67'h44569f84503e4bd75;
    stim[22] = 67'h72457b4c8a4e979e4;
    stim[23] = 67'h6a273a401402304dd;
    stim[24] = 67'h5392454f89254effd;
    stim[25] = 67'h45b430ad169471819;
    stim[26] = 67'h56ba71757e8d3abfd;
    stim[27] = 67'h19989e9e95256efcd;
    stim[28] = 67'h3f021bc71a54cd485;
    stim[29] = 67'h79d3cc514ac4f7d55;
    stim[30] = 67'h78df98d60c79a04c8;
    stim[31] = 67'h45608dea7bcd82028;
    stim[32] = 67'h4c5cda7390e90885c;
    stim[33] = 67'h735f5d5aa55aede6d;
    stim[34] = 67'h25f589e8bdd3a6435;
    stim[35] = 67'h14e8220204e9e4500;
    stim[36] = 67'h028474b50b635ef95;
    stim[37] = 67'h1b8170ea40814689d;
    stim[38] = 67'h7a4b97fab81d2f02d;
    stim[39] = 67'h4217fcfe0fbe2b0c5;
    stim[40] = 67'h21fe337e835aff411;
    stim[41] = 67'h153ed57254ea57acd;
    stim[42] = 67'h580b79e3bae2ab95d;
    stim[43] = 67'h79f066c11bf745ed4;
    stim[44] = 67'h1b00788956fccb328;
    stim[45] = 67'h2d60bc2f4ae66f25d;
    stim[46] = 67'h57364d96937754710;
    stim[47] = 67'h04ad30f218d2bc41d;
    stim[48] = 67'h55494eabfbaa0ca3d;
    stim[49] = 67'h225457c0d747b9cad;
    stim[50] = 67'h1d81e01d8624444d9;
    stim[51] = 67'h16a4fc3afd2a9f8b5;
    stim[52] = 67'h5c24e8b96ab5517ac;
    stim[53] = 67'h5afa27d4190ca8c0c;
    stim[54] = 67'h47473f329d025dfe5;
    stim[55] = 67'h1c3c3c41d927a1e01;
    stim[56] = 67'h424ff6c7a3007766d;
    stim[57] = 67'h3e43357ef799fcb2d;
    stim[58] = 67'h49fa582e8ae35abe5;
    stim[59] = 67'h5370b551bde11ee14;
    stim[60] = 67'h408b8c7d3864a8be9;
    stim[61] = 67'h715d23dadeff16e39;
    stim[62] = 67'h6787b5c127012b930;
    stim[63] = 67'h045cff3f86a2eab11;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
