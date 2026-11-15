// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_126912 dut (
    .A(in_vec[64:33]),
    .B(in_vec[32:1]),
    .reset(in_vec[0:0]),
    .C(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1798b3c61fd1584ef;
    stim[1] = 65'h0669a9b637812e2e3;
    stim[2] = 65'h00092a418019c406a;
    stim[3] = 65'h17e7e71860418fb82;
    stim[4] = 65'h047e0a80073c347b8;
    stim[5] = 65'h0e5aee01c8888aa4a;
    stim[6] = 65'h09cd23648b39487ce;
    stim[7] = 65'h19213a65d1882aeb6;
    stim[8] = 65'h1e29ca99982c7b6b2;
    stim[9] = 65'h0a9bd2fbd7bebe08e;
    stim[10] = 65'h191190db34b0d92e2;
    stim[11] = 65'h047d465d9d47abfec;
    stim[12] = 65'h183f5aace1bba836a;
    stim[13] = 65'h1f6abcbf2104caf82;
    stim[14] = 65'h00202a3116be661fc;
    stim[15] = 65'h097bbc7a29837191a;
    stim[16] = 65'h1c9e50061d01607f4;
    stim[17] = 65'h0a58733da3e265218;
    stim[18] = 65'h18cf36c0fd902c69e;
    stim[19] = 65'h08ce6ad72caf16528;
    stim[20] = 65'h0d08490edf48647ca;
    stim[21] = 65'h1f55884c3a8ac74aa;
    stim[22] = 65'h18ab2b161f5ae3650;
    stim[23] = 65'h0ece4a62e28256c0d;
    stim[24] = 65'h1864329ca03b87986;
    stim[25] = 65'h023133bcfcf504198;
    stim[26] = 65'h067e70f0726bb7794;
    stim[27] = 65'h1d74ddd02a1b6bbb8;
    stim[28] = 65'h14ca5ba09f55e7d06;
    stim[29] = 65'h1061f801f55123e9c;
    stim[30] = 65'h136cb559389a150ba;
    stim[31] = 65'h086347fab20406dd2;
    stim[32] = 65'h0101ee7568aa5b290;
    stim[33] = 65'h1a5ed609621f659e0;
    stim[34] = 65'h0f52b1bd4b7334aee;
    stim[35] = 65'h1bff1212f329e2322;
    stim[36] = 65'h1fbe71a8a4793e80c;
    stim[37] = 65'h0522fc86150604d7e;
    stim[38] = 65'h0a15f0c0aa42c23ee;
    stim[39] = 65'h1722823fc2b9a2f16;
    stim[40] = 65'h19110894ff4841934;
    stim[41] = 65'h0facd685970d37510;
    stim[42] = 65'h19136b6cc74623cf0;
    stim[43] = 65'h08ce44f7e35b9af92;
    stim[44] = 65'h05fb0c90db8d7355a;
    stim[45] = 65'h11d7f09894cd10502;
    stim[46] = 65'h0060fcc0363515a82;
    stim[47] = 65'h1afdb13119cda6958;
    stim[48] = 65'h181b7997e604961d8;
    stim[49] = 65'h1611765ba57d075e6;
    stim[50] = 65'h1e0cc364eadac436c;
    stim[51] = 65'h1e1c1ddd8880662ba;
    stim[52] = 65'h1bdd580c694575bc0;
    stim[53] = 65'h0ff8fb49b5a3deb0e;
    stim[54] = 65'h0684d773a41fc19e8;
    stim[55] = 65'h026a2e87192edaa96;
    stim[56] = 65'h0bf795fb24709307c;
    stim[57] = 65'h05bb79108e3da6275;
    stim[58] = 65'h192910eedce163886;
    stim[59] = 65'h1faf14633c5aa3112;
    stim[60] = 65'h1160c462988454504;
    stim[61] = 65'h0fa1e8c52c088f15c;
    stim[62] = 65'h04bdb0d93c929991c;
    stim[63] = 65'h161836128a5ba7c34;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h01177241;
      expv[3] = 32'hc14bb684;
      expv[4] = 32'h5dd1f7dc;
      expv[5] = 32'hb71bc533;
      expv[6] = 32'ha8335f0b;
      expv[7] = 32'h554b2a89;
      expv[8] = 32'hb2b23025;
      expv[9] = 32'h12d48825;
      expv[10] = 32'h6e13504a;
      expv[11] = 32'h0e2792e2;
      expv[12] = 32'hcfd8171c;
      expv[13] = 32'h037c3dba;
      expv[14] = 32'hb6f48286;
      expv[15] = 32'h97f9705e;
      expv[16] = 32'hccfd842a;
      expv[17] = 32'h71d6c2f9;
      expv[18] = 32'hb2fb1956;
      expv[19] = 32'habec094d;
      expv[20] = 32'h62856c5b;
      expv[21] = 32'hcf027cb6;
      expv[22] = 32'hc03073d8;
      expv[23] = 32'h00000000;
      expv[24] = 32'hc4fdd1a8;
      expv[25] = 32'hf931beb3;
      expv[26] = 32'hc751434d;
      expv[27] = 32'h3c824c5d;
      expv[28] = 32'ha1021b87;
      expv[29] = 32'h2d98df5d;
      expv[30] = 32'h60365326;
      expv[31] = 32'hd33a76be;
      expv[32] = 32'h4d624cf3;
      expv[33] = 32'he3f1dd3b;
      expv[34] = 32'hd62f3361;
      expv[35] = 32'h7947a228;
      expv[36] = 32'h21bd814b;
      expv[37] = 32'hd1480aef;
      expv[38] = 32'ha2c597fc;
      expv[39] = 32'hcee12989;
      expv[40] = 32'hc2ca5141;
      expv[41] = 32'h35d06eb4;
      expv[42] = 32'h02cc79de;
      expv[43] = 32'h614eff88;
      expv[44] = 32'h0c43ff33;
      expv[45] = 32'h35280745;
      expv[46] = 32'hb4b09342;
      expv[47] = 32'ha65abe34;
      expv[48] = 32'hf1007dab;
      expv[49] = 32'hdc73edd0;
      expv[50] = 32'h473c3cdd;
      expv[51] = 32'h34e42049;
      expv[52] = 32'h29166e43;
      expv[53] = 32'h2ce6cfd4;
      expv[54] = 32'h5524c891;
      expv[55] = 32'hdcc84983;
      expv[56] = 32'h83414817;
      expv[57] = 32'h00000000;
      expv[58] = 32'hb053a3b9;
      expv[59] = 32'he04dbba2;
      expv[60] = 32'h4f28c596;
      expv[61] = 32'hdd53bed7;
      expv[62] = 32'h0a825357;
      expv[63] = 32'h039eeeae;
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
