// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 80;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087580 dut (
    .clk(clk),
    .ra(in_vec[79:73]),
    .re(in_vec[72:72]),
    .ore(in_vec[71:71]),
    .wa(in_vec[70:64]),
    .we(in_vec[63:63]),
    .di(in_vec[62:48]),
    .byp_sel(in_vec[47:47]),
    .dbyp(in_vec[46:32]),
    .pwrbus_ram_pd(in_vec[31:0]),
    .dout(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 80'h368fe0dc23d0d5d45cd5;
    stim[1] = 80'h145f9337c7db2799a083;
    stim[2] = 80'h08303c92bdea5b33a9a3;
    stim[3] = 80'h3907f2652da380578a0e;
    stim[4] = 80'hf8ba0d0d8ea09377e050;
    stim[5] = 80'h75bd0530381122a3e417;
    stim[6] = 80'he02ebae8e43beb57559a;
    stim[7] = 80'haaac4621e8e341d92e00;
    stim[8] = 80'h0d0c400265b75358591d;
    stim[9] = 80'h1782dd2564f9f2e08c8e;
    stim[10] = 80'h894c10f61b567d60272f;
    stim[11] = 80'h6065b947f7d065a0a1b2;
    stim[12] = 80'he58babe54c71b161b9b1;
    stim[13] = 80'h726c941231f402fd8829;
    stim[14] = 80'hcfe31656019359117baf;
    stim[15] = 80'hb288307ba2d7e0171661;
    stim[16] = 80'h2cce5bb471deaf8a376a;
    stim[17] = 80'h9eb689b2be0c277af012;
    stim[18] = 80'hd3e951abf404fe055c87;
    stim[19] = 80'h383ad3bafb16d07f12a5;
    stim[20] = 80'hbbe674f90b228f3d6fd4;
    stim[21] = 80'hac4e4b6b17b24220c6ee;
    stim[22] = 80'hea9dc8e54d5bcf4cab3a;
    stim[23] = 80'h2e2967a63d915b96c5dd;
    stim[24] = 80'hdf043a0fc3c7b5ecd5dd;
    stim[25] = 80'h92213d3280a786480243;
    stim[26] = 80'hc22207781e7a402423b1;
    stim[27] = 80'hfd0a112bd04ec33cfdc7;
    stim[28] = 80'he462e4336682b340db5b;
    stim[29] = 80'he70cf00c04aa91c9ef5d;
    stim[30] = 80'haad0caa04004937e630f;
    stim[31] = 80'h9c9bcd0023b9b915711d;
    stim[32] = 80'h3aad1acfd148b852bbf8;
    stim[33] = 80'h703861bf535b2f837c01;
    stim[34] = 80'h069ff8c00e62d1f042cb;
    stim[35] = 80'h05cf939764876f7cd2df;
    stim[36] = 80'hca0840db0a95b9e732bd;
    stim[37] = 80'hd156ba1d5478f1f20148;
    stim[38] = 80'hee4514e31e3263a9bfbd;
    stim[39] = 80'h401a9fe2db4741657150;
    stim[40] = 80'hb6a11351c4775a3a9ff1;
    stim[41] = 80'h62eb2e8d42209d150b9d;
    stim[42] = 80'h39f0e648248e4b723bf8;
    stim[43] = 80'h287765ca120bc5a344ba;
    stim[44] = 80'ha53ab440db18b3ea0787;
    stim[45] = 80'hb0b7b6e9c7f020ba499a;
    stim[46] = 80'h20de058966374a1c81b2;
    stim[47] = 80'hc9aecbb4abf76b1bb212;
    stim[48] = 80'h316a6d2059cd805896de;
    stim[49] = 80'hb2024c518cc4913a890b;
    stim[50] = 80'h0ea76e4270cafb388344;
    stim[51] = 80'hdbe32a9741d8c62ae24b;
    stim[52] = 80'hbaec0249634fd173721f;
    stim[53] = 80'h6a5d9502ca8372aca964;
    stim[54] = 80'hfae408e33506e8c5f4e2;
    stim[55] = 80'h83788a16480c690c6a87;
    stim[56] = 80'h9252d0712d02e5e4d275;
    stim[57] = 80'h9ffbec8b9a3e8e5fccf9;
    stim[58] = 80'h5584164ee20e8e6a9420;
    stim[59] = 80'h45e23d9498172ea3da02;
    stim[60] = 80'h064f9be6494fae09c9f7;
    stim[61] = 80'h1bbf32d66a90cd56e077;
    stim[62] = 80'he486af285af425b0371d;
    stim[63] = 80'h05d33ad676623a06c568;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'hxxxx;
      expv[2] = 15'hxxxx;
      expv[3] = 15'hxxxx;
      expv[4] = 15'hxxxx;
      expv[5] = 15'h0ea0;
      expv[6] = 15'hxxxx;
      expv[7] = 15'hxxxx;
      expv[8] = 15'h68e3;
      expv[9] = 15'h68e3;
      expv[10] = 15'hxxxx;
      expv[11] = 15'hxxxx;
      expv[12] = 15'hxxxx;
      expv[13] = 15'hxxxx;
      expv[14] = 15'hxxxx;
      expv[15] = 15'hxxxx;
      expv[16] = 15'h22d7;
      expv[17] = 15'hxxxx;
      expv[18] = 15'h3e0c;
      expv[19] = 15'h7404;
      expv[20] = 15'h7404;
      expv[21] = 15'hxxxx;
      expv[22] = 15'hxxxx;
      expv[23] = 15'hxxxx;
      expv[24] = 15'hxxxx;
      expv[25] = 15'hxxxx;
      expv[26] = 15'hxxxx;
      expv[27] = 15'hxxxx;
      expv[28] = 15'hxxxx;
      expv[29] = 15'hxxxx;
      expv[30] = 15'hxxxx;
      expv[31] = 15'hxxxx;
      expv[32] = 15'hxxxx;
      expv[33] = 15'h5148;
      expv[34] = 15'h5148;
      expv[35] = 15'hxxxx;
      expv[36] = 15'hxxxx;
      expv[37] = 15'hxxxx;
      expv[38] = 15'hxxxx;
      expv[39] = 15'hxxxx;
      expv[40] = 15'hxxxx;
      expv[41] = 15'h4477;
      expv[42] = 15'hxxxx;
      expv[43] = 15'hxxxx;
      expv[44] = 15'hxxxx;
      expv[45] = 15'hxxxx;
      expv[46] = 15'h47f0;
      expv[47] = 15'hxxxx;
      expv[48] = 15'h2bf7;
      expv[49] = 15'h2bf7;
      expv[50] = 15'h2bf7;
      expv[51] = 15'hxxxx;
      expv[52] = 15'hxxxx;
      expv[53] = 15'hxxxx;
      expv[54] = 15'hxxxx;
      expv[55] = 15'hxxxx;
      expv[56] = 15'hxxxx;
      expv[57] = 15'hxxxx;
      expv[58] = 15'h1a3e;
      expv[59] = 15'h620e;
      expv[60] = 15'h1817;
      expv[61] = 15'h1817;
      expv[62] = 15'hxxxx;
      expv[63] = 15'hxxxx;
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
