// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_178603 dut (
    .clk(clk),
    .A(in_vec[66:35]),
    .B(in_vec[34:3]),
    .CtrlFunc(in_vec[2:0]),
    .Result(out_vec[35:4]),
    .Flags(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h40e6b09c82312ebfb;
    stim[1] = 67'h22db2e11cc25d874b;
    stim[2] = 67'h77cde5129e4279d00;
    stim[3] = 67'h54053b5e656d25d85;
    stim[4] = 67'h4b4ffc6c7f81540b0;
    stim[5] = 67'h1174b4dd651066ae2;
    stim[6] = 67'h7dff415f8111913b1;
    stim[7] = 67'h0c1b9480e8cdbace4;
    stim[8] = 67'h06fe93e246299087f;
    stim[9] = 67'h263a7099f7b47cac0;
    stim[10] = 67'h26157e46452006765;
    stim[11] = 67'h510852c04704829dd;
    stim[12] = 67'h2aa34ebbf3ed1830f;
    stim[13] = 67'h0c57379b3fcda7150;
    stim[14] = 67'h5ad94bb1625f5bf66;
    stim[15] = 67'h4e5b13d75544e8526;
    stim[16] = 67'h2480472741bcd81f7;
    stim[17] = 67'h2ce6bd00d32891a19;
    stim[18] = 67'h2ef4e060ef34f1f96;
    stim[19] = 67'h50c3905d71bf48de6;
    stim[20] = 67'h05caf05a5b921d4a4;
    stim[21] = 67'h5393db8ed4a111154;
    stim[22] = 67'h43f36fe494fa6a1b6;
    stim[23] = 67'h562315d44968bfa3d;
    stim[24] = 67'h7b9410210b45e7e9c;
    stim[25] = 67'h1f2da4f696352f6da;
    stim[26] = 67'h52999876efafa41b7;
    stim[27] = 67'h3eb56aebb74a4c9aa;
    stim[28] = 67'h5ad0f08c578040842;
    stim[29] = 67'h7236e8f3472b33bde;
    stim[30] = 67'h0104d36b5e96c3f30;
    stim[31] = 67'h03740c1e3e712ef63;
    stim[32] = 67'h13a2e054007d666ab;
    stim[33] = 67'h1a183bb3f76b4d5cf;
    stim[34] = 67'h3d54220e88ff563f6;
    stim[35] = 67'h69265c0f5d38df497;
    stim[36] = 67'h15763d00aa9b5f254;
    stim[37] = 67'h49606c141cc5a983c;
    stim[38] = 67'h014eb65adfd47f47d;
    stim[39] = 67'h45158f0c74e26474b;
    stim[40] = 67'h4367a73606fbb2fcc;
    stim[41] = 67'h4d7f54afdba760a4b;
    stim[42] = 67'h26b531794729c4a99;
    stim[43] = 67'h2a70d63aa62aa41e8;
    stim[44] = 67'h6b71b6635df615826;
    stim[45] = 67'h64c75e9b71e0ef75b;
    stim[46] = 67'h144c54af003c863f9;
    stim[47] = 67'h7ea93458e3f67ec70;
    stim[48] = 67'h100a6f5de6e5c920b;
    stim[49] = 67'h609b3abf0b154f6b4;
    stim[50] = 67'h0410b51a57de29e58;
    stim[51] = 67'h62291b8c282d3b74f;
    stim[52] = 67'h4d560ac9e057384e6;
    stim[53] = 67'h7f3b4bf221bee41fd;
    stim[54] = 67'h187a034db7b3d61bf;
    stim[55] = 67'h3599fb1b4cf7b5b1d;
    stim[56] = 67'h4bd2ec54946073f81;
    stim[57] = 67'h79f67c11e74b58ae8;
    stim[58] = 67'h46338270a61118e5c;
    stim[59] = 67'h00246529ab4176f8f;
    stim[60] = 67'h77843cd8b157f9c57;
    stim[61] = 67'h1df26ce3b96c779db;
    stim[62] = 67'h448e7644fbf76f596;
    stim[63] = 67'h68eab7c26cdbb604d;
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
      expv[0] = 36'hxxxxxxxxx;
      expv[1] = 36'h862fbeb88;
      expv[2] = 36'hde020d0c8;
      expv[3] = 36'h2c80c2200;
      expv[4] = 36'heada7fbc8;
      expv[5] = 36'h9602a8108;
      expv[6] = 36'h58c89c5e0;
      expv[7] = 36'hf9dda0c98;
      expv[8] = 36'h469bb3650;
      expv[9] = 36'h000000004;
      expv[10] = 36'h4c60e1100;
      expv[11] = 36'hce6afcec8;
      expv[12] = 36'hae19a5bb8;
      expv[13] = 36'h000000004;
      expv[14] = 36'h188a4e220;
      expv[15] = 36'h8d969c588;
      expv[16] = 36'h2d0ccb780;
      expv[17] = 36'h000000004;
      expv[18] = 36'hff9c59428;
      expv[19] = 36'h7a0c59720;
      expv[20] = 36'h325162980;
      expv[21] = 36'h5471a6200;
      expv[22] = 36'hfde594f38;
      expv[23] = 36'h5899a8660;
      expv[24] = 36'hbed77fef8;
      expv[25] = 36'he09c506f8;
      expv[26] = 36'h11f0eb120;
      expv[27] = 36'h000000004;
      expv[28] = 36'h0ed63ca20;
      expv[29] = 36'h06a160100;
      expv[30] = 36'h077b63820;
      expv[31] = 36'h000986c60;
      expv[32] = 36'h83ca76288;
      expv[33] = 36'h28408d7d0;
      expv[34] = 36'h000000004;
      expv[35] = 36'hee5b02468;
      expv[36] = 36'h000000004;
      expv[37] = 36'hd5b5bbb78;
      expv[38] = 36'h593585210;
      expv[39] = 36'hbfbdfebf8;
      expv[40] = 36'h73efe7010;
      expv[41] = 36'h78d7e8730;
      expv[42] = 36'h524d6aa80;
      expv[43] = 36'hc339eba18;
      expv[44] = 36'h444108350;
      expv[45] = 36'h775af5180;
      expv[46] = 36'had509c218;
      expv[47] = 36'h28e1a5210;
      expv[48] = 36'hc54068808;
      expv[49] = 36'hede070fc8;
      expv[50] = 36'hab0bd6a88;
      expv[51] = 36'h082042000;
      expv[52] = 36'h000000004;
      expv[53] = 36'h743775940;
      expv[54] = 36'hff7fdfff8;
      expv[55] = 36'h000000004;
      expv[56] = 36'hfbffff778;
      expv[57] = 36'hbf653f598;
      expv[58] = 36'hc284b0018;
      expv[59] = 36'h4044d3160;
      expv[60] = 36'h000000004;
      expv[61] = 36'h000000004;
      expv[62] = 36'haebdc9028;
      expv[63] = 36'h819945428;
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
