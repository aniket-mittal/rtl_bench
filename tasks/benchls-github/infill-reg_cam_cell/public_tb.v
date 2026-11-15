// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  reg_cam_cell dut (
    .clk(clk),
    .rst(in_vec[98:98]),
    .wdata(in_vec[97:66]),
    .wcare(in_vec[65:34]),
    .wused(in_vec[33:33]),
    .wena(in_vec[32:32]),
    .lookup_data(in_vec[31:0]),
    .match(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h426dccfff04451edbd15ccb55;
    stim[1] = 99'h76f615c08f6ba4a19ab9de817;
    stim[2] = 99'h2b43f6d642ee8f873720a9a75;
    stim[3] = 99'h266bb0ba3d3f5f05ab838eec6;
    stim[4] = 99'h264f1dce8fa0fd3314a306a2a;
    stim[5] = 99'h205efeb8b936e4f66bc661e19;
    stim[6] = 99'h32bd8f156edaa4a82a45584ca;
    stim[7] = 99'h15eee29ee522ee3b36e1f5222;
    stim[8] = 99'h1740e7d057a3b3f6a17fc3bf4;
    stim[9] = 99'h21efecd552acb5d546fbcb656;
    stim[10] = 99'h33565222b83d4d1cc8001f98b;
    stim[11] = 99'h1180a3af232cead20e56ff82d;
    stim[12] = 99'h341c7e180ec0b045022991cb1;
    stim[13] = 99'h131efdea7bc0fcd482f1ea6f7;
    stim[14] = 99'h0cee3ce81f9b36d02a2a229b5;
    stim[15] = 99'h0b16fabdd171e6e1734d230fe;
    stim[16] = 99'h38382db8d029bfe1465e8dde3;
    stim[17] = 99'h17446925a39b3f965df16bdbf;
    stim[18] = 99'h04853224205464f6324f45fdf;
    stim[19] = 99'h0a6616dfdbcbf4aa78e3b793c;
    stim[20] = 99'h31c667aedffbd6ca65b809ff7;
    stim[21] = 99'h2dcd762eb6d44cce0b5e19da3;
    stim[22] = 99'h209902633012880e61e1b9e96;
    stim[23] = 99'h097c8b6b096a6719a77b5b6b1;
    stim[24] = 99'h06bd7d34df3a81261c262929f;
    stim[25] = 99'h1a36f73757c90076e63ad5804;
    stim[26] = 99'h0dc7688162aee367f2bd4224d;
    stim[27] = 99'h0423e8a55a7e8b71bc27cfd10;
    stim[28] = 99'h29fec990d40c887b256175ba5;
    stim[29] = 99'h5e0d988c7544b0c3f145ed0bf;
    stim[30] = 99'h2f27e44829f20fb323caaf055;
    stim[31] = 99'h12f49e2a15eb15ddc314c5feb;
    stim[32] = 99'h1f402f9cb21a35a45a27380f6;
    stim[33] = 99'h2073bd3a1743d378f3765d6b6;
    stim[34] = 99'h3f3b6c13e06d56ae0b2df636c;
    stim[35] = 99'h18eb21e17801d401f68fccb9f;
    stim[36] = 99'h108dc25674b50fdaca3390fd7;
    stim[37] = 99'h0f8bb122c093f7b1ba7cd7b62;
    stim[38] = 99'h2f1dffe1db619c950bd0b8189;
    stim[39] = 99'h036f513aa150b36581a3d6fe3;
    stim[40] = 99'h23846f588bb917794faaa671a;
    stim[41] = 99'h38bbeea3c434290f49bbd62c3;
    stim[42] = 99'h35692f8c228793afdcba7a3b8;
    stim[43] = 99'h2e899ff0cadd45c7d4fe1b345;
    stim[44] = 99'h07076baa5af4f54bb7614f4eb;
    stim[45] = 99'h326614fdb42852721bcb295c2;
    stim[46] = 99'h3859197f55644cc39ecaf0686;
    stim[47] = 99'h34d213204cae41f01c33d2876;
    stim[48] = 99'h212ae6968a5ad0897e1a70516;
    stim[49] = 99'h372a585c1aaad4c5cd649fe83;
    stim[50] = 99'h0e0fe0d9523e87b47bc48c3d5;
    stim[51] = 99'h107389a6a820ca00959dae27b;
    stim[52] = 99'h279b9318caa1b7ae115e651f4;
    stim[53] = 99'h39edd56903cc24f0715838e1a;
    stim[54] = 99'h2acc42e355d7cb9462f7a7a99;
    stim[55] = 99'h09ba9ef0a07d6d5bef21ac58e;
    stim[56] = 99'h23d52428d885a866e10d84e6c;
    stim[57] = 99'h02bea2742afd3af75d5cfb8ac;
    stim[58] = 99'h04b09e0dba2125b181d82f0c4;
    stim[59] = 99'h06ac12819a4d817d2cede872c;
    stim[60] = 99'h0030e36c8bae9ca5ad491d66c;
    stim[61] = 99'h2359fe7ac8a63367b355a30c9;
    stim[62] = 99'h39a4d063f68ffa01b81e159ed;
    stim[63] = 99'h148374e7f85f366667c542861;
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
      expv[0] = 1'hx;
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
