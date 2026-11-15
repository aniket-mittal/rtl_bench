module five_hex(c3, c2, c1, c0, m);
  input c3, c2, c1, c0;
  output m;

  assign m = ((~c3 & ~c2 & c0) | (~c3 & c1 & c0) | (~c3 & ~c2 & c1) | (c3 & c2 & ~c1 & c0));
endmodule