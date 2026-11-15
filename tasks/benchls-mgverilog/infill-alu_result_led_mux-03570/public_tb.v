// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03570 dut (
    .OF(in_vec[36:36]),
    .ZF(in_vec[35:35]),
    .SW(in_vec[34:32]),
    .ALU_F(in_vec[31:0]),
    .LED(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h154967a33a;
    stim[1] = 37'h04e971c137;
    stim[2] = 37'h12c19e5d17;
    stim[3] = 37'h18d43cf694;
    stim[4] = 37'h1dfbe9780d;
    stim[5] = 37'h0b6d68ce1a;
    stim[6] = 37'h1f9d8da93d;
    stim[7] = 37'h14baa0feee;
    stim[8] = 37'h03b090f39a;
    stim[9] = 37'h1813975e5d;
    stim[10] = 37'h19fea7af08;
    stim[11] = 37'h0b72bead0b;
    stim[12] = 37'h1ea56fd463;
    stim[13] = 37'h12eea79ec7;
    stim[14] = 37'h16503f0c32;
    stim[15] = 37'h00512f0076;
    stim[16] = 37'h1aa4fae43b;
    stim[17] = 37'h0254f6f533;
    stim[18] = 37'h0b052ea93f;
    stim[19] = 37'h1f3926924b;
    stim[20] = 37'h1ef1191f5a;
    stim[21] = 37'h18559d4872;
    stim[22] = 37'h0e341f81b7;
    stim[23] = 37'h0b4184a526;
    stim[24] = 37'h1e6b39c1a1;
    stim[25] = 37'h0f3de1c1e6;
    stim[26] = 37'h01a1b61a73;
    stim[27] = 37'h14a65a85a1;
    stim[28] = 37'h008b186990;
    stim[29] = 37'h17283fc08b;
    stim[30] = 37'h00736bd217;
    stim[31] = 37'h1e86813592;
    stim[32] = 37'h01ac07c038;
    stim[33] = 37'h034fc6058c;
    stim[34] = 37'h188d8ac0a6;
    stim[35] = 37'h1bba21f8ca;
    stim[36] = 37'h1c2fe97f32;
    stim[37] = 37'h02a6a14bab;
    stim[38] = 37'h1abe4e167a;
    stim[39] = 37'h10424c4d93;
    stim[40] = 37'h12713c63f9;
    stim[41] = 37'h1822aa7d98;
    stim[42] = 37'h118d5dcfeb;
    stim[43] = 37'h06b59fcdca;
    stim[44] = 37'h13c465e431;
    stim[45] = 37'h171794e4a5;
    stim[46] = 37'h1f1a385da1;
    stim[47] = 37'h12522c8acf;
    stim[48] = 37'h0ff5b24338;
    stim[49] = 37'h101af3d2c3;
    stim[50] = 37'h0cb526e460;
    stim[51] = 37'h072384f720;
    stim[52] = 37'h0f4d225e76;
    stim[53] = 37'h02bc6f9611;
    stim[54] = 37'h11bd8bc5b3;
    stim[55] = 37'h1814bc772d;
    stim[56] = 37'h1230e1ae54;
    stim[57] = 37'h09b3052704;
    stim[58] = 37'h094df370f2;
    stim[59] = 37'h1002c3adf0;
    stim[60] = 37'h1957564799;
    stim[61] = 37'h0cc852f557;
    stim[62] = 37'h1c804fdec2;
    stim[63] = 37'h198197ad4f;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h9e;
      expv[3] = 8'h94;
      expv[4] = 8'h00;
      expv[5] = 8'h6d;
      expv[6] = 8'h00;
      expv[7] = 8'h01;
      expv[8] = 8'hb0;
      expv[9] = 8'h5d;
      expv[10] = 8'haf;
      expv[11] = 8'h72;
      expv[12] = 8'h00;
      expv[13] = 8'ha7;
      expv[14] = 8'h00;
      expv[15] = 8'h76;
      expv[16] = 8'hfa;
      expv[17] = 8'hf6;
      expv[18] = 8'h05;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h72;
      expv[22] = 8'h00;
      expv[23] = 8'h41;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h1a;
      expv[27] = 8'h01;
      expv[28] = 8'h90;
      expv[29] = 8'h00;
      expv[30] = 8'h17;
      expv[31] = 8'h00;
      expv[32] = 8'hc0;
      expv[33] = 8'h4f;
      expv[34] = 8'ha6;
      expv[35] = 8'hba;
      expv[36] = 8'h03;
      expv[37] = 8'ha1;
      expv[38] = 8'h4e;
      expv[39] = 8'h93;
      expv[40] = 8'h3c;
      expv[41] = 8'h98;
      expv[42] = 8'hcf;
      expv[43] = 8'h00;
      expv[44] = 8'hc4;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h2c;
      expv[48] = 8'h00;
      expv[49] = 8'hc3;
      expv[50] = 8'h02;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h6f;
      expv[54] = 8'hc5;
      expv[55] = 8'h2d;
      expv[56] = 8'he1;
      expv[57] = 8'h27;
      expv[58] = 8'h70;
      expv[59] = 8'hf0;
      expv[60] = 8'h47;
      expv[61] = 8'h02;
      expv[62] = 8'h03;
      expv[63] = 8'had;
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
