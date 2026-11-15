// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00684 dut (
    .i_data(in_vec[39:8]),
    .i_syndrome(in_vec[7:0]),
    .o_data(out_vec[33:2]),
    .o_error_detected(out_vec[1:1]),
    .o_uncorrected_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h36d61fc426;
    stim[1] = 40'heedf8aefce;
    stim[2] = 40'h82e1802cdb;
    stim[3] = 40'hfe944af008;
    stim[4] = 40'h67067a1607;
    stim[5] = 40'hf329a860dd;
    stim[6] = 40'haf22cfcc89;
    stim[7] = 40'hbb64527366;
    stim[8] = 40'h88c709b8fa;
    stim[9] = 40'h9d50e492eb;
    stim[10] = 40'h2675d88b44;
    stim[11] = 40'h1084b77bf5;
    stim[12] = 40'hd7ed55044f;
    stim[13] = 40'h011437c8cc;
    stim[14] = 40'hda1b10d862;
    stim[15] = 40'h55dbfc35b9;
    stim[16] = 40'h3c470dd155;
    stim[17] = 40'h9fc2f00fd8;
    stim[18] = 40'h5c85739aca;
    stim[19] = 40'h30a70ae07c;
    stim[20] = 40'h6c34d930ee;
    stim[21] = 40'hd3ce3bb61e;
    stim[22] = 40'ha3839059c8;
    stim[23] = 40'h9fb96c1b8b;
    stim[24] = 40'h9f4ce6ac2c;
    stim[25] = 40'h4df52ecc5e;
    stim[26] = 40'hfb2e09ae48;
    stim[27] = 40'h64acf5ddd7;
    stim[28] = 40'hdefaedf4be;
    stim[29] = 40'h5f9a54723a;
    stim[30] = 40'h28f38aa704;
    stim[31] = 40'h4a60bba660;
    stim[32] = 40'h5c10092f9c;
    stim[33] = 40'h9298d250ce;
    stim[34] = 40'hc5ec87585d;
    stim[35] = 40'ha3be672fa4;
    stim[36] = 40'h775a00271a;
    stim[37] = 40'hd25497c51f;
    stim[38] = 40'hd08d5331fe;
    stim[39] = 40'h75e37f3a34;
    stim[40] = 40'h07f27dd5c8;
    stim[41] = 40'he804b23964;
    stim[42] = 40'h14c2d140d3;
    stim[43] = 40'h61ae5b3b75;
    stim[44] = 40'hf4ce1bc8c7;
    stim[45] = 40'hb79fb9cf13;
    stim[46] = 40'h929e678331;
    stim[47] = 40'h7f728a7a9e;
    stim[48] = 40'h4d4d7db62f;
    stim[49] = 40'h4118ac6f65;
    stim[50] = 40'h5217444297;
    stim[51] = 40'hf4cf62c0a8;
    stim[52] = 40'h208a73bb3e;
    stim[53] = 40'h7e1047cef1;
    stim[54] = 40'h95250ad634;
    stim[55] = 40'hafc7cbcc30;
    stim[56] = 40'h6ab9487485;
    stim[57] = 40'he2ca3c0487;
    stim[58] = 40'h30b4242d30;
    stim[59] = 40'h77168ba925;
    stim[60] = 40'h2807e9d358;
    stim[61] = 40'hd593f17311;
    stim[62] = 40'h7434b8c8ee;
    stim[63] = 40'hc4f5a7d227;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 34'h0db587f32;
      expv[1] = 34'h3bb7e2bbf;
      expv[2] = 34'h20b8600b3;
      expv[3] = 34'h3fa512bc2;
      expv[4] = 34'h19c19e85b;
      expv[5] = 34'h3cca6a183;
      expv[6] = 34'h2bc8a3f32;
      expv[7] = 34'h2ed9149cf;
      expv[8] = 34'h2231c26e3;
      expv[9] = 34'h27543924b;
      expv[10] = 34'h099d7622f;
      expv[11] = 34'h04212ddef;
      expv[12] = 34'h35fb55413;
      expv[13] = 34'h00450df23;
      expv[14] = 34'h3786c4362;
      expv[15] = 34'h1576ff0d7;
      expv[16] = 34'h0f11c3747;
      expv[17] = 34'h27f0bc03f;
      expv[18] = 34'h17215ce6b;
      expv[19] = 34'h0c29c2b83;
      expv[20] = 34'h1b0d364c3;
      expv[21] = 34'h34f38eedb;
      expv[22] = 34'h28e0e4167;
      expv[23] = 34'h27ee5b06f;
      expv[24] = 34'h27d339ab3;
      expv[25] = 34'h137d4bb33;
      expv[26] = 34'h3ecb826bb;
      expv[27] = 34'h192b3d777;
      expv[28] = 34'h37bebb7d3;
      expv[29] = 34'h17e6951cb;
      expv[30] = 34'h0a3ce2a9e;
      expv[31] = 34'h12982ee9b;
      expv[32] = 34'h1704024bf;
      expv[33] = 34'h24a634943;
      expv[34] = 34'h317b21d63;
      expv[35] = 34'h20ef99cbe;
      expv[36] = 34'h1dd68089e;
      expv[37] = 34'h349525f17;
      expv[38] = 34'h342354cc7;
      expv[39] = 34'h1d78dfceb;
      expv[40] = 34'h01fc9f757;
      expv[41] = 34'h3e012c8e6;
      expv[42] = 34'h0530b4503;
      expv[43] = 34'h186b96cef;
      expv[44] = 34'h3d3386f23;
      expv[45] = 34'h2de7ee73f;
      expv[46] = 34'h24a799e0f;
      expv[47] = 34'h1fdca29eb;
      expv[48] = 34'h13535f6db;
      expv[49] = 34'h10462b1bf;
      expv[50] = 34'h1485d110b;
      expv[51] = 34'h1d33d8b02;
      expv[52] = 34'h08229ceef;
      expv[53] = 34'h1f8411f3b;
      expv[54] = 34'h254942b5b;
      expv[55] = 34'h2bf1f2f33;
      expv[56] = 34'h1aae520d2;
      expv[57] = 34'h38b28f013;
      expv[58] = 34'h0c2d090b7;
      expv[59] = 34'h1dc5a2eb6;
      expv[60] = 34'h0a11fa74e;
      expv[61] = 34'h3564fc5cf;
      expv[62] = 34'h1d0d2e323;
      expv[63] = 34'h313d69f4b;
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
