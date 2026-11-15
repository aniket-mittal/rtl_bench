// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 163;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_153474 dut (
    .clk(clk),
    .resetn(in_vec[5:5]),
    .enable(in_vec[4:4]),
    .write_allowed(in_vec[3:3]),
    .read_allowed(in_vec[2:2]),
    .reads_pending(in_vec[1:1]),
    .writes_pending(in_vec[0:0]),
    .write_req(out_vec[162:162]),
    .read_req(out_vec[161:161]),
    .write_data(out_vec[160:33]),
    .address(out_vec[32:1]),
    .mode(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h07;
    stim[1] = 6'h0f;
    stim[2] = 6'h24;
    stim[3] = 6'h37;
    stim[4] = 6'h2b;
    stim[5] = 6'h37;
    stim[6] = 6'h29;
    stim[7] = 6'h27;
    stim[8] = 6'h23;
    stim[9] = 6'h2a;
    stim[10] = 6'h3a;
    stim[11] = 6'h29;
    stim[12] = 6'h31;
    stim[13] = 6'h38;
    stim[14] = 6'h34;
    stim[15] = 6'h20;
    stim[16] = 6'h09;
    stim[17] = 6'h27;
    stim[18] = 6'h38;
    stim[19] = 6'h2f;
    stim[20] = 6'h39;
    stim[21] = 6'h21;
    stim[22] = 6'h39;
    stim[23] = 6'h3e;
    stim[24] = 6'h3d;
    stim[25] = 6'h39;
    stim[26] = 6'h20;
    stim[27] = 6'h25;
    stim[28] = 6'h2c;
    stim[29] = 6'h21;
    stim[30] = 6'h2c;
    stim[31] = 6'h2f;
    stim[32] = 6'h30;
    stim[33] = 6'h36;
    stim[34] = 6'h37;
    stim[35] = 6'h28;
    stim[36] = 6'h2a;
    stim[37] = 6'h23;
    stim[38] = 6'h26;
    stim[39] = 6'h35;
    stim[40] = 6'h30;
    stim[41] = 6'h3e;
    stim[42] = 6'h16;
    stim[43] = 6'h20;
    stim[44] = 6'h21;
    stim[45] = 6'h35;
    stim[46] = 6'h34;
    stim[47] = 6'h2c;
    stim[48] = 6'h3b;
    stim[49] = 6'h2f;
    stim[50] = 6'h2a;
    stim[51] = 6'h2f;
    stim[52] = 6'h27;
    stim[53] = 6'h3c;
    stim[54] = 6'h2d;
    stim[55] = 6'h3c;
    stim[56] = 6'h2c;
    stim[57] = 6'h2d;
    stim[58] = 6'h38;
    stim[59] = 6'h24;
    stim[60] = 6'h3c;
    stim[61] = 6'h2f;
    stim[62] = 6'h36;
    stim[63] = 6'h2c;
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
      expv[0] = 163'h00000000000000000000000000000000000000000;
      expv[1] = 163'h00000000000000000000000000000000000000000;
      expv[2] = 163'h00000000000000000000000000000000000000000;
      expv[3] = 163'h00000000000000000000000000000000000000000;
      expv[4] = 163'h00000000000000000000000000000000000000000;
      expv[5] = 163'h00000000000000000000000000000000000000000;
      expv[6] = 163'h00000000000000000000000000000000000000000;
      expv[7] = 163'h00000000000000000000000000000000000000000;
      expv[8] = 163'h00000000000000000000000000000000000000000;
      expv[9] = 163'h00000000000000000000000000000000000000000;
      expv[10] = 163'h402548add13659bec1fe997610ed8865xxxxxxxxx;
      expv[11] = 163'h402568adf13679bee1feb97630eda865xxxxxxxxx;
      expv[12] = 163'h002568adf13679bee1feb97630eda865xxxxxxxxx;
      expv[13] = 163'h002568adf13679bee1feb97630eda865xxxxxxxxx;
      expv[14] = 163'h4025c8ae5136d9bf41ff197690ee0865xxxxxxxxx;
      expv[15] = 163'h0025c8ae5136d9bf41ff197690ee0865xxxxxxxxx;
      expv[16] = 163'h00000000000000000000000000000000000000000;
      expv[17] = 163'h00000000000000000000000000000000000000000;
      expv[18] = 163'h00000000000000000000000000000000000000000;
      expv[19] = 163'h00000000000000000000000000000000000000000;
      expv[20] = 163'h00000000000000000000000000000000000000000;
      expv[21] = 163'h00000000000000000000000000000000000000000;
      expv[22] = 163'h00000000000000000000000000000000000000000;
      expv[23] = 163'h00000000000000000000000000000000000000000;
      expv[24] = 163'h402528adb13639bea1fe7975f0ed6864xxxxxxxxx;
      expv[25] = 163'h002528adb13639bea1fe7975f0ed6864xxxxxxxxx;
      expv[26] = 163'h002528adb13639bea1fe7975f0ed6864xxxxxxxxx;
      expv[27] = 163'h002528adb13639bea1fe7975f0ed6864xxxxxxxxx;
      expv[28] = 163'h002528adb13639bea1fe7975f0ed6864xxxxxxxxx;
      expv[29] = 163'h4025c8ae5136d9bf41ff197690ee0865xxxxxxxxx;
      expv[30] = 163'h0025c8ae5136d9bf41ff197690ee0865xxxxxxxxx;
      expv[31] = 163'h402608ae913719bf81ff5976d0ee4865xxxxxxxxx;
      expv[32] = 163'h002608ae913719bf81ff5976d0ee4865xxxxxxxxx;
      expv[33] = 163'h002608ae913719bf81ff5976d0ee4865xxxxxxxxx;
      expv[34] = 163'h002608ae913719bf81ff5976d0ee4865xxxxxxxxx;
      expv[35] = 163'h002608ae913719bf81ff5976d0ee4865xxxxxxxxx;
      expv[36] = 163'h4026a8af3137b9c021fff97770eee866xxxxxxxxx;
      expv[37] = 163'h4026c8af5137d9c04200197790ef0866xxxxxxxxx;
      expv[38] = 163'h0026c8af5137d9c04200197790ef0866xxxxxxxxx;
      expv[39] = 163'h0026c8af5137d9c04200197790ef0866xxxxxxxxx;
      expv[40] = 163'h0026c8af5137d9c04200197790ef0866xxxxxxxxx;
      expv[41] = 163'h0026c8af5137d9c04200197790ef0866xxxxxxxxx;
      expv[42] = 163'h00000000000000000000000000000000000000000;
      expv[43] = 163'h00000000000000000000000000000000000000000;
      expv[44] = 163'h00000000000000000000000000000000000000000;
      expv[45] = 163'h00000000000000000000000000000000000000000;
      expv[46] = 163'h00000000000000000000000000000000000000000;
      expv[47] = 163'h00000000000000000000000000000000000000000;
      expv[48] = 163'h4024e8ad7135f9be61fe3975b0ed2864xxxxxxxxx;
      expv[49] = 163'h0024e8ad7135f9be61fe3975b0ed2864xxxxxxxxx;
      expv[50] = 163'h0024e8ad7135f9be61fe3975b0ed2864xxxxxxxxx;
      expv[51] = 163'h402548add13659bec1fe997610ed8865xxxxxxxxx;
      expv[52] = 163'h002548add13659bec1fe997610ed8865xxxxxxxxx;
      expv[53] = 163'h002548add13659bec1fe997610ed8865xxxxxxxxx;
      expv[54] = 163'h4025a8ae3136b9bf21fef97670ede865xxxxxxxxx;
      expv[55] = 163'h0025a8ae3136b9bf21fef97670ede865xxxxxxxxx;
      expv[56] = 163'h4025e8ae7136f9bf61ff3976b0ee2865xxxxxxxxx;
      expv[57] = 163'h402608ae913719bf81ff5976d0ee4865xxxxxxxxx;
      expv[58] = 163'h002608ae913719bf81ff5976d0ee4865xxxxxxxxx;
      expv[59] = 163'h402648aed13759bfc1ff997710ee8866xxxxxxxxx;
      expv[60] = 163'h002648aed13759bfc1ff997710ee8866xxxxxxxxx;
      expv[61] = 163'h402688af113799c001ffd97750eec866xxxxxxxxx;
      expv[62] = 163'h002688af113799c001ffd97750eec866xxxxxxxxx;
      expv[63] = 163'h002688af113799c001ffd97750eec866xxxxxxxxx;
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
