// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h0d0a9078;
    stim[1] = 32'h268b28a9;
    stim[2] = 32'h08e57735;
    stim[3] = 32'h73ea72b1;
    stim[4] = 32'hd2da5564;
    stim[5] = 32'hb9ff09fa;
    stim[6] = 32'h22e43dbe;
    stim[7] = 32'h1cf8b154;
    stim[8] = 32'h6fc151c7;
    stim[9] = 32'h1b860a75;
    stim[10] = 32'h650d76f5;
    stim[11] = 32'h0817546a;
    stim[12] = 32'h10ee9fd6;
    stim[13] = 32'hdfb3cd53;
    stim[14] = 32'hbeb13c84;
    stim[15] = 32'h2d1f5306;
    stim[16] = 32'h712293d6;
    stim[17] = 32'h9c472fa4;
    stim[18] = 32'h0a9f776f;
    stim[19] = 32'h309b4d01;
    stim[20] = 32'h1bc67d8b;
    stim[21] = 32'h1e694f4c;
    stim[22] = 32'h0427f582;
    stim[23] = 32'h3321edcc;
    stim[24] = 32'hf4ab1a66;
    stim[25] = 32'h720e356b;
    stim[26] = 32'hc2902c5e;
    stim[27] = 32'h27bdb2eb;
    stim[28] = 32'hf6316abf;
    stim[29] = 32'h421d3981;
    stim[30] = 32'h5dbdedc1;
    stim[31] = 32'h7f7e7694;
    stim[32] = 32'hb399f5f7;
    stim[33] = 32'h0ffd45e7;
    stim[34] = 32'h7c1ea849;
    stim[35] = 32'h389fc3e5;
    stim[36] = 32'h5e740246;
    stim[37] = 32'hf5f2cd6a;
    stim[38] = 32'hdc6461dd;
    stim[39] = 32'hc48dc705;
    stim[40] = 32'h184ad3bd;
    stim[41] = 32'he0e1f62e;
    stim[42] = 32'ha16579b6;
    stim[43] = 32'h6b5ed3e9;
    stim[44] = 32'he5d23b90;
    stim[45] = 32'ha2b83924;
    stim[46] = 32'h3d912b13;
    stim[47] = 32'h14604898;
    stim[48] = 32'h7b362493;
    stim[49] = 32'h8613b973;
    stim[50] = 32'hab1b61f0;
    stim[51] = 32'hdc39a8a2;
    stim[52] = 32'hd6b792eb;
    stim[53] = 32'h85441b9c;
    stim[54] = 32'hbe6487bb;
    stim[55] = 32'h40350774;
    stim[56] = 32'h22ff852c;
    stim[57] = 32'heb3a8f54;
    stim[58] = 32'hf4b203db;
    stim[59] = 32'ha4011571;
    stim[60] = 32'h9f8aa84b;
    stim[61] = 32'ha5cb0800;
    stim[62] = 32'hea04251b;
    stim[63] = 32'ha060c7dc;
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
      expv[0] = 32'h78900a00;
      expv[1] = 32'ha9288b00;
      expv[2] = 32'h3577e500;
      expv[3] = 32'hb172ea00;
      expv[4] = 32'h6455da00;
      expv[5] = 32'hfa09ff00;
      expv[6] = 32'hbe3de400;
      expv[7] = 32'h54b1f800;
      expv[8] = 32'hc751c100;
      expv[9] = 32'h750a8600;
      expv[10] = 32'hf5760d00;
      expv[11] = 32'h6a541700;
      expv[12] = 32'hd69fee00;
      expv[13] = 32'h53cdb300;
      expv[14] = 32'h843cb100;
      expv[15] = 32'h06531f00;
      expv[16] = 32'hd6932200;
      expv[17] = 32'ha42f4700;
      expv[18] = 32'h6f779f00;
      expv[19] = 32'h014d9b00;
      expv[20] = 32'h8b7dc600;
      expv[21] = 32'h4c4f6900;
      expv[22] = 32'h82f52700;
      expv[23] = 32'hcced2100;
      expv[24] = 32'h661aab00;
      expv[25] = 32'h6b350e00;
      expv[26] = 32'h5e2c9000;
      expv[27] = 32'hebb2bd00;
      expv[28] = 32'hbf6a3100;
      expv[29] = 32'h81391d00;
      expv[30] = 32'hc1edbd00;
      expv[31] = 32'h94767e00;
      expv[32] = 32'hf7f59900;
      expv[33] = 32'he745fd00;
      expv[34] = 32'h49a81e00;
      expv[35] = 32'he5c39f00;
      expv[36] = 32'h46027400;
      expv[37] = 32'h6acdf200;
      expv[38] = 32'hdd616400;
      expv[39] = 32'h05c78d00;
      expv[40] = 32'hbdd34a00;
      expv[41] = 32'h2ef6e100;
      expv[42] = 32'hb6796500;
      expv[43] = 32'he9d35e00;
      expv[44] = 32'h903bd200;
      expv[45] = 32'h2439b800;
      expv[46] = 32'h132b9100;
      expv[47] = 32'h98486000;
      expv[48] = 32'h93243600;
      expv[49] = 32'h73b91300;
      expv[50] = 32'hf0611b00;
      expv[51] = 32'ha2a83900;
      expv[52] = 32'heb92b700;
      expv[53] = 32'h9c1b4400;
      expv[54] = 32'hbb876400;
      expv[55] = 32'h74073500;
      expv[56] = 32'h2c85ff00;
      expv[57] = 32'h548f3a00;
      expv[58] = 32'hdb03b200;
      expv[59] = 32'h71150100;
      expv[60] = 32'h4ba88a00;
      expv[61] = 32'h0008cb00;
      expv[62] = 32'h1b250400;
      expv[63] = 32'hdcc76000;
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
